import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/therapist/activity/t_activity_model.dart';

abstract class IPActivityService {
  IPActivityService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<TActivityModel?> getRecentActivities();

  Future<TActivityModel?> getActivityById(String activityId);

  Future<List<TActivityModel?>?> getMyActivitiesOrdered(
      {String lastDocId, String orderField, bool isDescending});

}
