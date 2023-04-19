import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/session/free_date/t_free_date_model.dart';
import '../../../model/therapist/session/free_date/t_free_hours_model.dart';
import '../../../model/therapist/session/t_join_video_call_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';

abstract class IPSessionService {
  IPSessionService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<TJoinVideoCallResultModel?> joinAVideoCall(TSessionModel session);

  Future<List<TFreeDateModel>> getAvailableDatesOrdered({
    String lastDocId,
    String orderField,
    bool isDescending,
  });

  Future<TFreeDateModel?> getAvailableDateById(String availableDate);

  /// If result is null, there is something wrongFuture<TJoinVideoCallResultModel?> joinAVideoCall(TSessionModel session);

  Future<bool> selectASession(TFreeHoursModel freeHours);
}
