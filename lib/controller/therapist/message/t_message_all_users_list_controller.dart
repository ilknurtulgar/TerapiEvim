import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

import '../../../model/common/user/user_model.dart';
import '../../../service/message/i_message_service.dart';
import '../../../service/message/message_service.dart';

class TMessageAllUsersListController extends GetxController
    with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  var personValue = false.obs;

  void onPersonListChange() {
    personValue.value = !personValue.value;
  }

  @override
  void onInit() {
    firestoreDBService = MessageService(vexaFireManager.networkManager);

    super.onInit();
  }

  late IMessageService firestoreDBService;

  Future<List<UserModel>> getAllUser() async {
    var allUserList = await firestoreDBService.getAllUsersByGroupId('');
    return allUserList;
  }
}
