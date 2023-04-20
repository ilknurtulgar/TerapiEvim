import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

import '../../../core/base/util/base_utility.dart';
import '../../../model/common/user/user_model.dart';
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
    final groups = await firestoreDBService.getGroupsOrdered();
    super.onInit();
  }

  late List<RxBool> isOpen =
      List.generate(DemoInformation.groupList.length, (index) => false.obs);

  void onPersonListChange(int index) {
    isOpen[index].value = !isOpen[index].value;
    print(index);
  }

  late IMessageService firestoreDBService;

  Future<List<UserModel>> getAllUser() async {
    var allUserList = await firestoreDBService.getAllUsersByGroupId('');
    return allUserList;
  }
}
