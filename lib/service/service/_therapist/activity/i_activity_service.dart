import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/activity/t_activity_model.dart';

abstract class IActivityService {
  IActivityService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an activity was not added
  Future<CreatedIdResponse?> createActivity(TActivityModel activity);

  Future<String?> updateActivity(TActivityModel activity);

  Future<TActivityModel?> getRecentActivity();

  Future<TActivityModel?> getActivityById(String activityId);

  Future<List<TActivityModel?>?> getMyActivitiesOrdered(
      {String lastDocId, String orderField, bool isDescending});

  Future<String?> deleteActivity(String activityId);
}
