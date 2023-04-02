import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/core/managers/firebase/firestore/models/created_id_response.dart';
import 'package:terapievim/service/model/common/user/user_model.dart';
import 'package:terapievim/service/model/therapist/group/t_group_model.dart';
import '../../../service/service/_therapist/group/i_t_group_service.dart';
import '../../../service/service/_therapist/group/t_group_service.dart';

class GroupAddController extends GetxController with BaseController {
  TextEditingController groupNameController = TextEditingController();
  late final ITGroupService tGroupService;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tGroupService = TGroupService(vexaFireManager.networkManager);
  }

  @override
  void dispose() {
    super.dispose();
    groupNameController.dispose();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  bool _validateNewGroup() {
    if (groupNameController.text.isEmpty) {
      flutterErrorToast("isim bos");
      return false;
    }
    return true;
  }

  Future<void> createNewGroup(BuildContext context) async {
    final NavigatorState navigator = Navigator.of(context);
    final bool isValidated = _validateNewGroup();
    if (isValidated == false) return;
    final TGroupModel groupModel = TGroupModel(
      name: groupNameController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),
      hasHelperTherapistAccepted: false,
      participantsId: [],
    );
    //page loading icin buradan yazabilirsin
    final CreatedIdResponse? idResponse =
        await tGroupService.createGroup(groupModel);
    //sonra tekrar false
    if (idResponse == null) return;
    navigationManager.maybePop(navigator);
  }

  //grup eklmee kismi icin controller
  var isSecTherapistElectionOpen = false.obs;
  void changeSecTherapistElection() {
    isSecTherapistElectionOpen.value = !isSecTherapistElectionOpen.isTrue;
  }

  var isDayElectionOpen = false.obs;
  void changeDayElection() {
    isDayElectionOpen.value = !isDayElectionOpen.isTrue;
  }

  void changeChoosenDay(String day) {
    choosenDay = RxString(day);
  }

  var choosenDay = "Gun Seciniz".obs;
  var choosenSecTherapist = "Yok".obs;
  var isSecTherapistChoosed = false.obs;

  void changeChoosenSecTherapist(String name) {
    isSecTherapistChoosed.value = true;
    choosenSecTherapist.value = name;
  }

  var isParticipantElectionOpen = false.obs;
  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }

  Future<void> setRandomUser() async {
    final UserModel? randomTherapist =
        await tGroupService.findRandomTherapistHelper();
    print(randomTherapist?.toJson());
  }
}