import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/base/service/base_service.dart';
import '../../core/constants/api_const.dart';
import '../../core/constants/app_const.dart';
import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../model/common/user/user_model.dart';
import '../../model/therapist/group/t_group_model.dart';
import 'i_message_service.dart';

class MessageService extends IMessageService with BaseService {
  MessageService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<UserModel>> getAllUsersByGroupId(String groupId) async {
    final result = await manager.readOne<TGroupModel, TGroupModel>(
        parseModel: TGroupModel(),
        collectionPath: APIConst.groups,
        docId: groupId);

    if (result.error != null || result.data == null) return [];
    final TGroupModel group = result.data!;

    if (group.participantsId == null) return [];

    List<UserModel> participants = [];
    if (group.therapistHelperId != null) {
      final UserModel? therapistHelper =
          await _getUserById(group.therapistHelperId!);

      if (therapistHelper != null) {
        participants.add(therapistHelper);
      }
    }

    for (String userId in group.participantsId!) {
      final UserModel? user = await _getUserById(userId);

      if (user == null) continue;

      participants.add(user);
    }

    return participants;
  }

  Future<UserModel?> _getUserById(String userId) async {
    final result = await manager.readOne<UserModel, UserModel>(
        parseModel: UserModel(), collectionPath: APIConst.users, docId: userId);

    if (result.error != null || result.data == null) return null;

    return result.data!;
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
  Stream<QuerySnapshot<Map<String, dynamic>?>> getStatus(String userId) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> ref = _firebaseFirestore
        .collection("messagegroups")
        //  .where("participantId", isEqualTo: userId)
        .snapshots();
    return ref;
  }
}
