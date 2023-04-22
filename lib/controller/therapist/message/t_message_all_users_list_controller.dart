import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

import '../../../core/base/util/base_utility.dart';
import '../../../model/common/user/user_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../service/message/i_message_service.dart';
import '../../../service/message/message_service.dart';

class TMessageAllUsersListController extends GetxController
    with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  @override
  Future<void> onInit() async {
    firestoreDBService = MessageService(vexaFireManager.networkManager);
    final List<TGroupModel> groups =
        await firestoreDBService.getGroupsOrdered();

    for (TGroupModel group in groups) {
      groupIds.add(group.id!);
      groupUsers[group.id!] =
          await firestoreDBService.getAllUsersByGroupId(group.id!);
    }

    super.onInit();
  }

  List<String> groupIds = [];

  RxMap<String, List<UserModel>> groupUsers = <String, List<UserModel>>{}.obs;

  late List<RxBool> isOpen =
      List.generate(DemoInformation.groupList.length, (index) => false.obs);

  void onPersonListChange(int index) {
    isOpen[index].value = !isOpen[index].value;
    print(index);
  }

  late IMessageService firestoreDBService;
  List<String> data = [];
  void coll() {
    FirebaseFirestore.instance
        .collection('messagegroups')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        data.add(doc['messagegroups']);
      });
    });
  }

  Future<List<UserModel>> getAllUser() async {
    var allUserList = await firestoreDBService.getAllUsersByGroupId('');
    return allUserList;
  }
}
