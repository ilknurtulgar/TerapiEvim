import '../../../../core/base/service/base_service.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../model/therapist/session/t_join_video_call_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';
import 'i_t_session_service.dart';

class TSessionService extends ITSessionService with BaseService {
  TSessionService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<TJoinVideoCallResultModel?> joinAVideoCall(
      TSessionModel session) async {
    ///TODO: add a service to join a video call.
    ///TODO: Maybe it will not be needed to handle here
    return null;
  }

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
}
