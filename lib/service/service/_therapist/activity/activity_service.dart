import '../../../../core/base/service/base_service.dart';
import '../../../../core/constants/api_const.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/therapist/activity/activity_model.dart';
import 'i_activity_service.dart';

class ActivityService extends IActivityService with BaseService {
  ActivityService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<CreatedIdResponse?> createActivity(ActivityModel activity) async {
    if (userId == null) return null;

    /// Setting id of a current therapist
    activity.therapistId = userId;

    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.therapist,
      docId: userId,
      collectionPath2: APIConst.activities,
      data: activity.toJson()!,
    );

    if (createdIdResponse != null) {
      return createdIdResponse;
    }

    return null;
  }

  @override
  Future<String?> updateActivity(ActivityModel activity) async {
    if (userId == null) return null;

    /// Overriding id of a current therapist
    activity.therapistId = userId;

    final result = await manager.update<ActivityModel, EmptyModel>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      docId2: activity.id,
      data: activity,
    );
    if (result.error != null) {
      return result.error?.description;
    }

    return null;
  }

  @override
  Future<String?> deleteActivity(String activityId) async {
    if (userId == null) return null;

    final result = await manager.delete(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      docId2: activityId,
    );
    if (result == false) {
      return "ERROR";
    }
    return null;
  }

  @override
  Future<ActivityModel?> getRecentActivity() async {
    if (userId == null) return null;

    final result =
        await manager.readOrdered<ActivityModel, List<ActivityModel>>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      parseModel: ActivityModel(),
      field: AppConst.dateTime,
      limit: 1,
      isDescending: true,
    );

    if (result.error != null) {
      return null;
    }
    if (result.data == null) return null;

    return result.data![0];
  }

  @override
  Future<ActivityModel?> getActivityById(String activityId) async {
    if (userId == null) return null;

    final result = await manager.read<ActivityModel, ActivityModel>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      docId2: activityId,
      parseModel: ActivityModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<ActivityModel?>?> getActivities(int currentPage) async {
    if (userId == null) return null;

    final result = await manager.read<ActivityModel, List<ActivityModel>>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      parseModel: ActivityModel(),
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }
}
