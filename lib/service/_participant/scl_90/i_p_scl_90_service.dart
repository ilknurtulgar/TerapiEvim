import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/participant/scl90test/test_scl_90_model.dart';

abstract class IPScl90Service {
  IPScl90Service(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an activity was not added
  Future<CreatedIdResponse?> submitTest(TestSCL90Model scl90);
}
