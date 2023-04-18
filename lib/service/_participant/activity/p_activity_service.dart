import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';

import 'i_p_activity_service.dart';

class PActivityService extends IPActivityService with BaseService {
  PActivityService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<List<TActivityModel>> getRecentActivities() async {
    if (userId == null) return [];

    final result =
        await manager.readOrdered<TActivityModel, List<TActivityModel>>(
      parseModel: TActivityModel(),
      collectionPath: APIConst.activities,
      orderField: AppConst.dateTime,
      limit: AppConst.twoItemsPerPage,
      lastDocumentId: AppConst.emptyString,
      isDescending: true,
    );

    if (result.error != null) {
      return [];
    }
    if (result.data == null) return [];
    if (result.data!.isEmpty) return [];

    return result.data!;
  }

  @override
  Future<TActivityModel?> getActivityById(String activityId) async {
    if (userId == null) return null;

    final result = await manager.readOne<TActivityModel, TActivityModel>(
      collectionPath: APIConst.activities,
      docId: activityId,
      parseModel: TActivityModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<TActivityModel?>> getPastActivitiesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result =
        await manager.readOrderedWhere<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.activities,
      parseModel: TActivityModel(),
      orderField: orderField,
      whereField: AppConst.isFinished,
      whereIsEqualTo: true,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data ?? [];
  }

  @override
  Future<List<TActivityModel>> getRecentActivitiesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result =
        await manager.readOrderedWhere<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.activities,
      parseModel: TActivityModel(),
      orderField: orderField,
      whereField: AppConst.isFinished,
      whereIsEqualTo: false,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data ?? [];
  }

  @override
  Future<bool> setActivityAttended(TActivityModel activity) async {
    if (userId == null) return false;

    final result = await manager.createWithDocId(
      collectionPath: APIConst.participant,
      docId: userId!,
      collectionPath2: APIConst.joinedActivities,
      docId2: activity.id,
      data: activity.toJson()!,
    );

    return result;
  }
}
