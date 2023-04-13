import 'package:terapievim/core/managers/firebase/firestore/models/created_id_response.dart';

import '../../../../core/base/service/base_service.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
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
  Future<CreatedIdResponse?> selectASession(String sessionId) async {
    if (userId == null) return null;

    final CreatedIdResponse? result = await manager.create(
      collectionPath: APIConst.participant,
      docId: userId,
      data: {AppConst.dateTime: sessionId},
    );

    return result;
  }

  @override
  Future<List<TSessionModel?>> getAvailableSessionsOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
    bool isFinished = false,
  }) async {
    if (userId == null) return [];

    final result =
        await manager.readOrderedWhere<TSessionModel, List<TSessionModel>>(
      collectionPath: APIConst.sessions,
      parseModel: TSessionModel(),
      orderField: orderField,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null || result.data == null) {
      return [];
    }

    return result.data!;
  }
}
