import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/common/scl_90/scl_90_result_model.dart';

abstract class IPScl90Service {
  IPScl90Service(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an activity was not added
  Future<CreatedIdResponse?> submitTest(Scl90ResultModel scl90);
}
