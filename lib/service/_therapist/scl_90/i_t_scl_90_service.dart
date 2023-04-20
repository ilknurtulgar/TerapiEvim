import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/common/group/group_category_model.dart';
import '../../../model/common/scl_90/scl_90_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';

abstract class ITScl90Service {
  ITScl90Service(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<Scl90ResultModel?> getSCLResultById({
    required String participantId,
  });

  Future<bool> setParticipantToACategory({
    required GroupCategoryModel groupCategory,
    required TSessionModel session,
  });
}
