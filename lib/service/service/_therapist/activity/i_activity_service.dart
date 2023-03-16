import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/activity/activity_model.dart';

abstract class IActivityService {
  IActivityService(
    this.manager,
    this.userId,
  );

  final IFirestoreManager<ErrorModelCustom> manager;
  final String userId;

  /// if result is null, it means an activity was not added
  Future<CreatedIdResponse?> createActivity(ActivityModel activity);

  Future<String?> updateActivity(ActivityModel activity);

  Future<ActivityModel?> getActivityById(String activityId);

  Future<List<ActivityModel?>?> getActivities(int currentPage);

  Future<String?> deleteActivity(ActivityModel activity);
}
