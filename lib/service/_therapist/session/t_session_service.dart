import '../../../../core/base/service/base_service.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/therapist/session/t_session_model.dart';
import 'i_t_session_service.dart';

class TSessionService extends ITSessionService with BaseService {
  TSessionService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<List<TSessionModel?>> getSessionsOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
    bool isFinished = false,
  }) async {
    if (userId == null) return [];

    final result =
        await manager.readOrderedWhere2<TSessionModel, List<TSessionModel>>(
      collectionPath: APIConst.sessions,
      parseModel: TSessionModel(),
      orderField: orderField,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
      whereField2: AppConst.isGroupCategorySet,
      whereIsEqualTo2: false,
    );
    if (result.error != null || result.data == null) {
      return [];
    }

    return result.data!;
  }

  @override
  Future<String?> updateSession(TSessionModel session) async {
    try {
      if (userId == null) {
        throw Exception(
            "userId is null in TSessionModel. t_session_service/updateSession");
      }

      if (session.id == null) {
        throw Exception(
            "ID is null in TSessionModel. t_session_service/updateSession");
      }

      final result = await manager.update<TSessionModel, EmptyModel>(
        collectionPath: APIConst.sessions,
        docId: session.id!,
        data: session,
      );

      if (result.error != null) {
        return result.error?.description;
      }

      return null;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      rethrow;
    }
  }
}
