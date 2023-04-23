import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/common/profile/p_public_profile_model.dart';
import '../../../model/common/user/user_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_about_group_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../model/therapist/group/t_group_session_model.dart';

/// TODO: when therapist joins a group as a helper, add the groupId here: users:helpingGroupsId

abstract class ITGroupService {
  ITGroupService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an group was not added
  Future<CreatedIdResponse?> createGroup(TGroupModel group);

  /// if result is null, it means an groupSession was not added
  Future<CreatedIdResponse?> createGroupSession(
      TGroupSessionModel groupSession);

  Future<UserModel?> findRandomTherapistHelper();

  Future<TGroupSessionModel?> getRecentGroupSession(String groupId);

  /// if result is null, it means is is successful
  Future<String?> updateGroup(TGroupModel group);

  Future<TAboutGroupModel?> getAboutTherapistHelper(String groupId);

  Future<List<TGroupModel>> getGroupsOrdered(
      {String lastDocId, String orderField, bool isDescending});

  Future<List<PPublicProfile>> getParticipantsList(
      {required List<String> participantsId});

  Future<String?> deleteGroup(String groupId);

  Future<List<TCopingMethodModel?>?> getCopingMethods({
    required String groupId,
    String lastDocId,
    String orderField,
    bool isDescending,
  });
}
