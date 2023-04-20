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
  var personValue = true.obs;
  late List<RxBool> isOpen =
      List.generate(DemoInformation.groupList.length, (index) => false.obs);
  //   List<RxBool>.filled(DemoInformation.groupList.length, false.obs);

  void onPersonListChange(int index) {
    isOpen[index].value = !isOpen[index].value;
    print(index);

    // isOpen[index].value = value;
    //  personValue.value = !personValue.value;
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
