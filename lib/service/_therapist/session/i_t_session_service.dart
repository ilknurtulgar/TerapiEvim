import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/therapist/session/t_session_model.dart';

abstract class ITSessionService {
  ITSessionService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// If you need to get sessions that are finished, set isFinished true
  Future<List<TSessionModel?>> getSessionsOrdered(
      {String lastDocId,
      String orderField,
      bool isDescending,
      bool isFinished});

  Future<String?> updateSession(TSessionModel session);
}
