import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/session/free_date/t_free_date_model.dart';
import '../../../model/therapist/session/t_join_video_call_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';

abstract class IPSessionService {
  IPSessionService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<List<TFreeDateModel>> getAvailableHoursOrdered({
    String lastDocId,
    String orderField,
    bool isDescending,
  });

  /// If result is null, there is something wrong
  Future<TJoinVideoCallResultModel?> joinAVideoCall(TSessionModel session);

  Future<CreatedIdResponse?> selectASession(String sessionId);
}
