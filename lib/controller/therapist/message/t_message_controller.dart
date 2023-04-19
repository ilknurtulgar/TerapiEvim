import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/message/message_service.dart';

import '../../../model/common/user/user_model.dart';
import '../../../service/message/i_message_service.dart';
import '../../base/base_controller_2.dart';

class TMessageController extends BaseController2 {
  @override
  void setContext(BuildContext context) {}

  @override
  void onInit() {
    firestoreDBService = MessageService(vexaFireManager.networkManager);

    super.onInit();
  }

  late IMessageService firestoreDBService;

  var personValue = false.obs;

  void onPersonListChange() {
    personValue.value = !personValue.value;
  }

  // Future<List<User>> getAllUsers() async {
  //   var allUserList = await getAllUser();
  //   return allUserList;
  // }

  Future<List<UserModel>> getAllUser() async {
    var allUserList = await firestoreDBService.getAllUsersByGroupId('');
    return allUserList;
  }
}
