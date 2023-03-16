import '../../../../core/base/service/base_service.dart';
import '../../../../core/constants/api_const.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/therapist/activity/activity_model.dart';
import 'i_activity_service.dart';

class ProfileSettingsService extends IActivityService with BaseService {
  ProfileSettingsService(
      IFirestoreManager<ErrorModelCustom> manager, String userId)
      : super(manager, userId);

  @override
  Future<CreatedIdResponse?> createActivity(ActivityModel activity) async {
    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.activities,
      collectionPath2: userId,
      docId: userId,
      data: activity.toJson()!,
    );

    if (createdIdResponse != null) {
      return createdIdResponse;
    }

    return null;
  }


  @override
  Future<String?> updateActivity(ActivityModel activity) async {
    final result = await manager.update<ActivityModel, EmptyModel>(
      collectionPath: APIConst.activities,
      collectionPath2: userId,
      docId: userId,
      docId2: activity.id,
      data: activity,
    );
    if (result.error != null) {
      return result.error?.description;
    }

    return null;
  }

  @override
  Future<String?> deleteActivity(ActivityModel activity) {
    // TODO: implement deleteActivity
    throw UnimplementedError();
  }

  @override
  Future<ActivityModel?> getActivityById(String activityId) {
    // TODO: implement getActivityById
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityModel?>?> getActivities(int currentPage) {
    // TODO: implement getActivities
    throw UnimplementedError();
  }

}
