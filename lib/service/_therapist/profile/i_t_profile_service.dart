import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_group_model.dart';

abstract class ITProfileService {
  ITProfileService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<List<TCopingMethodModel?>?> getCopingMethodsOrdered(
      {String lastDocId, String orderField, bool isDescending});

  Future<List<TActivityModel?>> getMyPastActivitiesOrdered(
      {String lastDocId, String orderField, bool isDescending});

}
