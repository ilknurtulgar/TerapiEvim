import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';
import '../../base/base_controller.dart';

class TGroupInformationController extends GetxController with BaseController {
  late final ITGroupService tGroupService;

  @override
  void onInit() {
    tGroupService = TGroupService(vexaFireManager.networkManager);
    super.onInit();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  //grup eklmee kismi icin controller

  var isParticipantElectionOpen = false.obs;

  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }
}
