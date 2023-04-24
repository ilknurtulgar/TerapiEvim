import '../../core/base/service/base_service.dart';
import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';

abstract class IShortVideoCallService extends BaseService {
  IShortVideoCallService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<String?> pSetIsSessionComplete();
}
