import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/common/activity/t_activity_model.dart';

abstract class ITActivityService {
  ITActivityService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an activity was not added
  Future<CreatedIdResponse?> createActivity(TActivityModel activity);

  Future<String?> updateActivity(TActivityModel activity);

  Future<TActivityModel?> getMyRecentActivity();

  Future<TActivityModel?> getMyPastRecentActivity();

  Future<TActivityModel?> getActivityById(String activityId);

  Future<List<TActivityModel?>> getMyRecentActivitiesOrdered(
      {String lastDocId, String orderField, bool isDescending});

  Future<List<TActivityModel?>> getMyPastActivitiesOrdered(
      {String lastDocId = '', String orderField, bool isDescending});

  Future<List<TActivityModel?>> getOtherRecentActivitiesOrdered(
      {String lastDocId = '', String orderField, bool isDescending});

  Future<String?> deleteActivity(String activityId);
}
