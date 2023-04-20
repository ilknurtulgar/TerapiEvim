import 'dart:math';

import 'package:terapievim/model/common/profile/p_public_profile_model.dart';

import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/common/profile/t_public_profile_model.dart';
import '../../../model/common/user/user_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_about_group_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import 'i_t_group_service.dart';

class TGroupService extends ITGroupService with BaseService {
  TGroupService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<CreatedIdResponse?> createGroup(TGroupModel group) async {
    if (userId == null) return null;

    if (group.groupCategory == null) return null;

    group.therapistId = userId;

    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.groups,
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
    if (group.id == null) return null;
    final result = await manager.update<TGroupModel, EmptyModel>(
      collectionPath: APIConst.groups,
      docId: group.id!,
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
      collectionPath: APIConst.groups,
      docId: groupId,
    );
    if (result == false) {
      return "ERROR";
    }
    return null;
  }

  @override
  Future<TAboutGroupModel?> getAboutGroup(String groupId) async {
    if (userId == null) return null;

    final TGroupModel? group = await _getGroup(groupId);

    if (group == null) return null;

    final TPublicProfile? therapistProfile =
        await _getTherapistProfile(group.therapistId!);

    if (therapistProfile == null) return null;

    final List<TGroupModel> helpingGroups =
        await _getHelpingGroups(group.participantsId);

    TAboutGroupModel tAboutGroup = TAboutGroupModel(
      id: group.id,
      therapistId: group.therapistId,
      groupName: group.name,
      aboutTherapist: therapistProfile.aboutMe,
      therapistName: therapistProfile.name,
      therapistImageUrl: therapistProfile.imageUrl,
      listOfHelpingGroups: helpingGroups,
    );

    return tAboutGroup;
  }

  Future<TGroupModel?> _getGroup(String groupId) async {
    final result = await manager.readOne<TGroupModel, TGroupModel>(
      collectionPath: APIConst.groups,
      docId: groupId,
      parseModel: TGroupModel(),
    );
    if (result.error != null || result.data == null) {
      return null;
    }
    return result.data;
  }

  Future<TPublicProfile?> _getTherapistProfile(String therapistId) async {
    final result = await manager.readOne<TPublicProfile, TPublicProfile>(
      collectionPath: APIConst.users,
      docId: therapistId,
      parseModel: TPublicProfile(),
    );

    if (result.error != null || result.data == null) {
      return null;
    }

    return result.data;
  }

  Future<List<TGroupModel>> _getHelpingGroups(List<String>? groupsId) async {
    final List<TGroupModel> helpingGroupsList = [];

    if (groupsId == null) return [];

    for (String groupId in groupsId) {
      final result = await manager.readOne<TGroupModel, TGroupModel>(
        collectionPath: APIConst.groups,
        docId: groupId,
        parseModel: TGroupModel(),
      );

      if (result.data != null) {
        helpingGroupsList.add(result.data!);
      }
    }

    return helpingGroupsList;
  }

  @override
  Future<List<TGroupModel>> getGroupsOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    List<TGroupModel> groups = [];

    final result =
        await manager.readOrderedWhere<TGroupModel, List<TGroupModel>>(
      collectionPath: APIConst.groups,
      parseModel: TGroupModel(),
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    final resultAsTherapistHelper =
        await manager.readOrderedWhere<TGroupModel, List<TGroupModel>>(
      collectionPath: APIConst.groups,
      parseModel: TGroupModel(),
      whereField: AppConst.therapistHelperId,
      whereIsEqualTo: userId!,
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );

    if (resultAsTherapistHelper.error != null) {
      return [];
    }

    groups.addAll(result.data!);

    groups.addAll(resultAsTherapistHelper.data!);

    return result.data ?? [];
  }

  @override
  Future<List<PPublicProfile>> getParticipantsList(
      {required List<String> participantsId}) async {
    final List<PPublicProfile> publicProfileList = [];

    for (String participantId in participantsId) {
      final result = await manager.readWhere<PPublicProfile, PPublicProfile>(
        collectionPath: APIConst.groups,
        whereField: AppConst.id,
        whereIsEqualTo: participantId,
        parseModel: PPublicProfile(),
      );

      if (result.data != null) {
        publicProfileList.add(result.data!);
      }
    }
    return publicProfileList;
  }

  @override
  Future<List<TCopingMethodModel?>> getCopingMethods({
    required String groupId,
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result = await manager.readOrderedWhere(
      collectionPath: APIConst.users,
      docId: userId,
      collectionPath2: APIConst.users,
      parseModel: TCopingMethodModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
      whereField: AppConst.groupId,
      whereIsEqualTo: groupId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }
}
