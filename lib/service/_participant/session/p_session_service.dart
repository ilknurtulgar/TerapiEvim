import 'package:terapievim/core/managers/firebase/firestore/models/created_id_response.dart';

import '../../../../core/base/service/base_service.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../model/therapist/session/free_date/t_free_date_model.dart';
import '../../../model/therapist/session/free_date/t_free_hours_model.dart';
import '../../../model/therapist/session/t_join_video_call_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';
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
  Future<List<TFreeDateModel>> getAvailableHoursOrdered({
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
  Future<CreatedIdResponse?> createSession(String freeTimeId) {
    // TODO: implement createSession
    throw UnimplementedError();
  }

  @override
  Future<CreatedIdResponse?> selectASession(String sessionId) async {
    if (userId == null) return null;

    final CreatedIdResponse? result = await manager.create(
      collectionPath: APIConst.participant,
      docId: userId,
      data: {AppConst.dateTime: sessionId},
    );

    return result;
  }
}
