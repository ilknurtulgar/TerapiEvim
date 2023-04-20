import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../model/common/user/user_model.dart';
import '../../model/therapist/group/t_group_model.dart';

abstract class IMessageService {
  IMessageService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  //tüm kullanıcıları bana getir
  Future<List<UserModel>> getAllUsersByGroupId(String groupId);

  Future<List<TGroupModel>> getGroupsOrdered(
      {String lastDocId, String orderField, bool isDescending});
}
