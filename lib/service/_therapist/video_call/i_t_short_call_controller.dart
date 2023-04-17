import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';

abstract class ITShortCallService {
  ITShortCallService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

}
