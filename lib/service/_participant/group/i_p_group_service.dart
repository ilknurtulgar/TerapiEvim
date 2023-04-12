import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/participant/group/join_group_id_model.dart';
import '../../../model/therapist/group/t_group_model.dart';

abstract class IPGroupService {
  IPGroupService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// It is used for getting joinedGroup
  Future<TGroupModel?> getGroupById(String groupId);

  Future<List<TGroupModel>> getGroupsByCategory({
    required String categoryName,
    String lastDocId,
    String orderField,
    bool isDescending,
  });

  /// returned True means success. After success,
  /// groupId should be saved in cache, so it can
  /// be used to load joinedGroup again
  Future<bool?> joinGroup(JoinGroupIdModel groupId);
}
