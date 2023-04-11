import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import 'i_p_profile_service.dart';

class PProfileService extends IPProfileService with BaseService {
  PProfileService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<TGroupModel?> getJoinedGroup(String joinedGroupId) async {
    if (userId == null) return null;

    final result = await manager.readWhere<TGroupModel, TGroupModel>(
      collectionPath: APIConst.groups,
      parseModel: TGroupModel(),
      whereField: AppConst.id,
      whereIsEqualTo: joinedGroupId,
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<TCopingMethodModel?>?> getMyViewedCopingMethods({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return null;

    final result =
        await manager.readOrdered<TCopingMethodModel, List<TCopingMethodModel>>(
      collectionPath: APIConst.participant,
      docId: userId!,
      collectionPath2: APIConst.viewedCopingMethods,
      parseModel: TCopingMethodModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }

  @override
  Future<List<TActivityModel?>> getMyJoinedActivities({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result =
        await manager.readOrdered<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.participant,
      docId: userId,
      collectionPath2: APIConst.joinedActivities,
      parseModel: TActivityModel(),
      orderField: orderField,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data ?? [];
  }
}
