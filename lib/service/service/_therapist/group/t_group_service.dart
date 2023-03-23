import '../../../../core/base/service/base_service.dart';
import '../../../../core/constants/api_const.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import 'i_t_group_service.dart';

class TActivityService extends ITGroupService with BaseService {
  TActivityService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<CreatedIdResponse?> createGroup(TGroupModel group) async {
    if (userId == null) return null;

    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.groups,
      data: group.toJson()!,
    );

    if (createdIdResponse != null) {
      return createdIdResponse;
    }

    return null;
  }

  @override
  Future<String?> updateGroup(TGroupModel group) async {
    if (userId == null) return null;
    final result = await manager.update<TGroupModel, EmptyModel>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.groups,
      docId2: group.groupId,
      data: group,
    );
    if (result.error != null) {
      return result.error?.description;
    }

    return null;
  }

  @override
  Future<String?> deleteGroup(String groupId) async {
    if (userId == null) return null;

    final result = await manager.delete(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.groups,
      docId2: groupId,
    );
    if (result == false) {
      return "ERROR";
    }
    return null;
  }

  @override
  Future<TGroupModel?> getGroupById(String groupId) async {
    if (userId == null) return null;
    final result = await manager.read<TGroupModel, TGroupModel>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.groups,
      docId2: groupId,
      parseModel: TGroupModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<TGroupModel?>?> getGroupsOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return null;

    final result =
        await manager.readManyOrdered<TGroupModel, List<TGroupModel>>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      parseModel: TGroupModel(),
      isDescending: isDescending,
      field: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }
}
