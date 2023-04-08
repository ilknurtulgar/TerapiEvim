import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/participant/group/join_group_id_model.dart';
import '../../../model/therapist/group/t_group_model.dart';

abstract class IPGroupService {
  IPGroupService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<TGroupModel?> getGroupById(String groupId);

  /// returned True means success
  Future<bool?> joinGroup(JoinGroupIdModel groupId);

  Future<List<TGroupModel?>> getGroupsOrdered(
      {String lastDocId, String orderField, bool isDescending});
}
