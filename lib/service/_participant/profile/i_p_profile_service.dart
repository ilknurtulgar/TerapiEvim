import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_group_model.dart';

abstract class IPProfileService {
  IPProfileService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<TGroupModel?> getJoinedGroup(String joinedGroupId);

  Future<List<TCopingMethodModel?>?> getMyViewedCopingMethods(
      {String lastDocId, String orderField, bool isDescending});

  Future<List<TActivityModel?>> getMyJoinedActivities(
      {String lastDocId, String orderField, bool isDescending});
}
