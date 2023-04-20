import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../model/common/user/user_model.dart';

abstract class IMessageService {
  IMessageService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  //tüm kullanıcıları bana getir
  Future<List<UserModel>> getAllUsersByGroupId(String groupId);
}
