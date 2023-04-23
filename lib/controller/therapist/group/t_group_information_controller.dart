import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/therapist/group/t_group_model.dart';
import '../../../model/therapist/group/t_group_session_model.dart';
import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';
import '../../base/base_controller.dart';

class TGroupInformationController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    context = controllerContext;
  }

  void setCurrentGroup(TGroupModel? group) => currentGroupModel = group;
  RxString helperTherapistName = ''.obs;
  RxString meetingTime = ''.obs;

  @override
  void onInit() {
    tGroupService = TGroupService(vexaFireManager.networkManager);

    ///TODO: tGroupService.getParticipantsList
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getMeetingInformation() async {
    TGroupSessionModel? sessionModel = await tGroupService
        .getRecentGroupSession(currentGroupModel?.id ?? "null");
    helperTherapistName.value = sessionModel?.therapistHelperName ?? "null";
    Timestamp? ts = sessionModel?.dateTime;
    if (ts.isNull) {
      meetingTime.value = "null";
    } else {
      DateTime dt =
          DateTime.fromMillisecondsSinceEpoch(ts!.millisecondsSinceEpoch);
      meetingTime.value = dt.day.toString() +
          "/" +
          dt.month.toString() +
          "/" +
          dt.year.toString() +
          "   " +
          dt.hour.toString() +
          "." +
          dt.minute.toString();
    }
  }

  late final ITGroupService tGroupService;

  TGroupModel? currentGroupModel;
  void deleteGroup() {
    currentGroupModel!.id = '';
  }

  //grup eklmee kismi icin controller
  var isParticipantElectionOpen = false.obs;

  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }
}
