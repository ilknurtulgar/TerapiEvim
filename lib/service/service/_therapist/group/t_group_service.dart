import 'dart:math';

import '../../../../core/base/service/base_service.dart';
import '../../../../core/constants/api_const.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/common/user/user_model.dart';
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
      data: group.toJson()!,
    );

    if (createdIdResponse != null) {
      return createdIdResponse;
    }

    return null;
  }

  @override
  Future<UserModel?> findRandomTherapistHelper() async {
    if (userId == null) return null;

    final result = await manager.readWhere<UserModel, List<UserModel?>>(
      collectionPath: APIConst.users,
      parseModel: UserModel(),
      limit: AppConst.twentyItemsPerPage,
      whereField: AppConst.role,
      whereIsEqualTo: AppConst.therapist,
    );

    if (result.error != null) return null;
    if (result.data == null) return null;

    int randomNumber = Random().nextInt(result.data!.length);
    final List<UserModel?> therapists = result.data!;

    /// It makes sure that a new number is generated every time
    /// if current therapist is the same as the randomTherapist
    while (therapists[randomNumber]!.id == userId) {
      randomNumber = Random().nextInt(result.data!.length);
    }

    if (randomNumber > therapists.length) {
      throw Exception("randomNumber > therapists.length in t_group_service");
    }

    if (therapists[randomNumber] == null) {
      throw Exception(
          "Null is retrieved from therapists[randomNumber] in t_group_service");
    }

    /// When while condition is quit. Last randomNumber is chosen as a random Therapist
    UserModel randomTherapist = therapists[randomNumber]!;

    return randomTherapist;
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
    final result = await manager.readOne<TGroupModel, TGroupModel>(
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

    final result = await manager.readOrdered<TGroupModel, List<TGroupModel>>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.activities,
      parseModel: TGroupModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }
}
