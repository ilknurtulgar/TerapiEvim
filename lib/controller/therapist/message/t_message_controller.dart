import 'package:flutter/src/widgets/framework.dart';
import 'package:terapievim/service/message/message_service.dart';

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
}
