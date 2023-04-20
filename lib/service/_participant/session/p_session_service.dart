import 'package:terapievim/core/managers/firebase/firestore/models/created_id_response.dart';

import '../../../../core/base/service/base_service.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/cache/local_manager.dart';
import '../../../model/therapist/session/free_date/t_free_date_model.dart';
import '../../../model/therapist/session/free_date/t_free_hours_model.dart';
import '../../../model/therapist/session/t_join_video_call_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import 'i_p_session_service.dart';

class PSessionService extends IPSessionService with BaseService {
  PSessionService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<TJoinVideoCallResultModel?> joinAVideoCall(
      TSessionModel session) async {
    ///TODO: add a service to join a video call.
    ///TODO: Maybe it will not be needed to handle here
    return null;
  }

  @override
  Future<List<TFreeDateModel>> getAvailableDatesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {

    if (userId == null) return [];

    final result =
        await manager.readOrdered<TFreeDateModel, List<TFreeDateModel>>(
      collectionPath: APIConst.freeDates,
      parseModel: TFreeDateModel(),
      orderField: orderField,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );

    if (result.error != null || result.data == null) {
      return [];
    }

    for (TFreeDateModel freeDate in result.data!) {
      if (freeDate.id == null) continue;

      final List<TFreeHoursModel> freeHours = await _getFreeHours(freeDate.id!);

      if (freeHours.isNotEmpty) freeDate.hours = [...freeHours];
    }

    return result.data!;
  }

  Future<List<TFreeHoursModel>> _getFreeHours(String freeDateId) async {
    try {
      final freeDateHours = await manager
          .readOrderedWhere2<TFreeHoursModel, List<TFreeHoursModel>>(
        parseModel: TFreeHoursModel(),
        collectionPath: APIConst.freeHours,
        docId: freeDateId,
        whereField: AppConst.freeDateId,
        whereIsEqualTo: freeDateId,
        whereField2: AppConst.isFree,
        whereIsEqualTo2: true,
        limit: AppConst.twentyItemsPerPage,
        orderField: AppConst.hour,
        lastDocumentId: '',
      );
      if (freeDateHours.error != null || freeDateHours.data == null) {
        return [];
      }
      return freeDateHours.data!;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: '_getFreeHours');
      rethrow;
    }
  }

  @override
  Future<bool> selectASession(TFreeHoursModel freeHours) async {
    if (userId == null) return false;

    final CreatedIdResponse? result = await manager.create(
      collectionPath: APIConst.participant,
      docId: userId,
      data: {AppConst.sessionId: freeHours.id},
    );

    if (result == null) return false;

    final TSessionModel newSession = TSessionModel(
      id: freeHours.id!,
      freeDateId: freeHours.freeDateId,
      isFinished: false,
      participantId: userId,
      participantName:
          LocalManager.instance.getStringValue(LocalManagerKeys.name),
      therapistId: freeHours.therapistId,
    );

    final bool isSessionCreated = await manager.createWithDocId(
      collectionPath: APIConst.sessions,
      docId: freeHours.id!,
      data: newSession.toJson()!,
    );

    return isSessionCreated;
  }

  @override
  Future<TFreeDateModel?> getAvailableDateById(String availableDate) async {
    return null;
  }
}
