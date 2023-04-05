import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/therapist/group/t_group_model.dart';
import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';
import '../../base/base_controller.dart';

class TGroupInformationController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  void setCurrentGroup(TGroupModel? group) => currentGroupModel = group;

  @override
  void onInit() {
    tGroupService = TGroupService(vexaFireManager.networkManager);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late final ITGroupService tGroupService;

  TGroupModel? currentGroupModel;

  //grup eklmee kismi icin controller
  var isParticipantElectionOpen = false.obs;

  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }
}
