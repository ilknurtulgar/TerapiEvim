import '../../../../core/base/service/base_service.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/cache/local_manager.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/participant/session/short_call_session_id_model.dart';
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
  Future<bool> selectASession(TFreeHoursModel freeHour) async {
    if (userId == null) return false;

    if (freeHour.id == null) return false;

    ShortCallSessionIdModel shortCallSessionId = ShortCallSessionIdModel(
      shortCallSessionId: freeHour.id,
      isSessionSelected: true,
    );

    freeHour.participantId = userId!;
    freeHour.isFree = false;

    final hourResult = await manager.update<TFreeHoursModel, EmptyModel>(
      collectionPath: APIConst.freeHours,
      docId: freeHour.id!,
      data: freeHour,
    );

    if (hourResult.error != null) return false;

    final shortCallSessionIdResult =
        await manager.update<ShortCallSessionIdModel, EmptyModel>(
      collectionPath: APIConst.participant,
      docId: userId!,
      data: shortCallSessionId,
    );

    if (shortCallSessionIdResult.error != null) return false;

    final TSessionModel newSession = TSessionModel(
      id: freeHour.id!,
      freeDateId: freeHour.freeDateId,
      isFinished: false,
      participantId: userId,
      participantName:
          LocalManager.instance.getStringValue(LocalManagerKeys.name),
      therapistId: freeHour.therapistId,
      isGroupCategorySet: false,
      meetingId: '',
      dateTime: freeHour.dateTime,
      therapistName: freeHour.therapistName,
    );

    final bool isSessionCreated = await manager.createWithDocId(
      collectionPath: APIConst.sessions,
      docId: freeHour.id!,
      data: newSession.toJson()!,
    );

    return isSessionCreated;
  }

  @override
  Future<TSessionModel?> getASession(String sessionId) async {
    if (userId == null) return null;

    final result = await manager.readWhere<TSessionModel, List<TSessionModel>>(
      collectionPath: APIConst.sessions,
      parseModel: TSessionModel(),
      whereField: AppConst.id,
      whereIsEqualTo: sessionId,
    );

    if (result.error != null || result.data == null) return null;

    return result.data![0];
  }

// @override
// Future<TFreeDateModel?> getAvailableDateById(String availableDate) async {
//   return null;
// }
}
