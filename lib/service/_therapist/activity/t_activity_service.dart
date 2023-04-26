import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/common/activity/t_activity_model.dart';
import 'i_t_activity_service.dart';

class TActivityService extends ITActivityService with BaseService {
  TActivityService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<CreatedIdResponse?> createActivity(TActivityModel activity) async {
    if (userId == null) return null;

    /// Setting id of a current therapist
    activity.therapistId = userId;

    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.activities,
      data: activity.toJson()!,
    );

    if (createdIdResponse != null) {
      return createdIdResponse;
    }

    return null;
  }

  @override
  Future<String?> updateActivity(TActivityModel activity) async {
    try {
      if (userId == null) {
        throw Exception(
            "userId is null in TActivityModel. activity_service/updateActivity");
      }

      if (activity.id == null) {
        throw Exception(
            "ID is null in TActivityModel. activity_service/updateActivity");
      }
      final result = await manager.update<TActivityModel, EmptyModel>(
        collectionPath: APIConst.activities,
        docId: activity.id!,
        data: activity,
      );
      if (result.error != null) {
        return result.error?.description;
      }

      return null;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return e.toString();
    }
  }

  @override
  Future<String?> deleteActivity(String activityId) async {
    if (userId == null) return null;

    final result = await manager.delete(
      collectionPath: APIConst.activities,
      docId: activityId,
    );
    if (result == false) {
      return "ERROR";
    }
    return null;
  }

  @override
  Future<TActivityModel?> getMyRecentActivity() async {
    if (userId == null) return null;

    final result =
        await manager.readOrderedWhere2<TActivityModel, List<TActivityModel>>(
      parseModel: TActivityModel(),
      collectionPath: APIConst.activities,
      orderField: AppConst.dateTime,
      limit: AppConst.oneItemPerPage,
      lastDocumentId: AppConst.emptyString,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      whereField2: AppConst.isFinished,
      whereIsEqualTo2: false,
      isDescending: true,
    );

    if (result.error != null) {
      return null;
    }
    if (result.data == null) return null;
    if (result.data!.isEmpty) return null;

    return result.data![0];
  }

  @override
  Future<TActivityModel?> getMyPastRecentActivity() async {
    if (userId == null) return null;

    final result =
        await manager.readOrderedWhere2<TActivityModel, List<TActivityModel>>(
      parseModel: TActivityModel(),
      collectionPath: APIConst.activities,
      orderField: AppConst.dateTime,
      limit: AppConst.oneItemPerPage,
      lastDocumentId: AppConst.emptyString,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      whereField2: AppConst.isFinished,
      whereIsEqualTo2: true,
      isDescending: true,
    );

    if (result.error != null) {
      return null;
    }
    if (result.data == null) return null;
    if (result.data!.isEmpty) return null;

    return result.data![0];
  }

  @override
  Future<TActivityModel?> getOtherRecentActivity() async {
    if (userId == null) return null;

    final result =
        await manager.readOrderedWhere<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.activities,
      parseModel: TActivityModel(),
      orderField: AppConst.dateTime,
      whereField: AppConst.isFinished,
      whereIsEqualTo: false,
      isDescending: false,
      lastDocumentId: '',
      limit: 1,
    );
    if (result.error != null || result.data == null) {
      return null;
    }
    if (result.data!.isEmpty) {
      return null;
    }

    return result.data![0] ;
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
  Future<List<TActivityModel?>> getMyRecentActivitiesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    ///TODO: update is code
    final result =
        await manager.readOrderedWhere2<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.activities,
      parseModel: TActivityModel(),
      orderField: orderField,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      whereField2: AppConst.isFinished,
      whereIsEqualTo2: false,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null || result.data == null) {
      return [];
    }

    return result.data!;
  }

  @override
  Future<List<TActivityModel?>> getMyPastActivitiesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result =
        await manager.readOrderedWhere2<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.activities,
      parseModel: TActivityModel(),
      orderField: orderField,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      whereField2: AppConst.isFinished,
      whereIsEqualTo2: true,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data ?? [];
  }

  @override
  Future<List<TActivityModel?>> getOtherRecentActivitiesOrdered({
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
}
