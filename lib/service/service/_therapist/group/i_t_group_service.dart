import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/group/t_group_model.dart';

abstract class ITGroupService {
  ITGroupService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an activity was not added
  Future<CreatedIdResponse?> createGroup(TGroupModel group);

  Future<String?> updateGroup(TGroupModel group);

  Future<TGroupModel?> getGroupById(String groupId);

  Future<List<TGroupModel?>?> getGroups(int currentPage);

  Future<String?> deleteGroup(String groupId);
}
