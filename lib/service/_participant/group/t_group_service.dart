import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/participant/group/join_group_id_model.dart';
import '../../../model/participant/group/joinable_group_model.dart';
import 'i_p_group_service.dart';

class PGroupService extends IPGroupService with BaseService {
  PGroupService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<JoinableGroupModel?> getGroupById(String groupId) async {
    if (userId == null) return null;
    final result = await manager.readOne<JoinableGroupModel, JoinableGroupModel>(
      collectionPath: APIConst.groups,
      docId: groupId,
      parseModel: JoinableGroupModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<JoinableGroupModel>> getGroupsByCategory({
    required String categoryName,
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];
    final result =
        await manager.readOrderedWhere<JoinableGroupModel, List<JoinableGroupModel>>(
      collectionPath: APIConst.groups,
      whereField: AppConst.groupCategory,
      whereIsEqualTo: categoryName,
      parseModel: JoinableGroupModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null || result.data == null) {
      return [];
    }

    return result.data!;
  }

  @override
  Future<bool?> joinGroup(JoinGroupIdModel joinGroup) async {
    try {
      if (joinGroup.joinedGroupId == null) {
        throw Exception('groupId.joinedGroupId == null');
      }
      if (userId == null) return false;
      final result = await manager.createWithDocId(
        collectionPath: APIConst.participant,
        docId: userId!,
        data: joinGroup.toJson()!,
      );

      return result;
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'joinGroup',
      );
      return false;
    }
  }
}
