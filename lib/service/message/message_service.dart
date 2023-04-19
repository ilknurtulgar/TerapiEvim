import 'package:terapievim/core/init/network/model/error_model_custom.dart';
import 'package:terapievim/core/managers/firebase/firestore/i_firestore_manager.dart';
import 'package:terapievim/model/common/user/user_model.dart';
import 'package:terapievim/service/message/i_message_service.dart';

import '../../core/constants/api_const.dart';
import '../../model/therapist/group/t_group_model.dart';

class MessageService extends IMessageService {
  MessageService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

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

    final UserModel? therapistHelper =
        await _getUserById(group.therapistHelperId!);

    if (therapistHelper != null) {
      participants.add(therapistHelper);
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
}
