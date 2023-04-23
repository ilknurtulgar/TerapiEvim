import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/core/managers/firebase/firestore/models/created_id_response.dart';
import 'package:terapievim/model/therapist/group/t_group_session_model.dart';

import '../../../core/base/component/group/scrollable_time.dart';
import '../../../model/common/user/user_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';

class TGroupAddController extends GetxController with BaseController {
  late final ITGroupService tGroupService;

  @override
  void onInit() {
    tGroupService = TGroupService(vexaFireManager.networkManager);
    super.onInit();
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

  TextEditingController groupNameController = TextEditingController();

  bool _validateNewGroup() {
    if (groupNameController.text.isEmpty) {
      flutterErrorToast("isim bos");
      return false;
    }
    if (chosenCategory.value.isEmpty) {
      flutterErrorToast("Kategori Bos");
      return false;
    }
    if (chosenSecTherapist == "Yok") {
      flutterErrorToast("Yardimci Terapist Secilmedi");
      return false;
    }
    if (chosenDay == "Yok") {
      flutterErrorToast("Terapi Gunu Secilmedi");
      return false;
    }
    if (numberOfWeek.text.isEmpty) {
      flutterErrorToast("Kac Hafta terapi yapilacagi secilmedi");
      return false;
    }
    if (numberOfSession.text.isEmpty) {
      flutterErrorToast("Kac terapi yapilacagi secilmedi");
      return false;
    }
    if (chosenHour.isEmpty) {
      flutterErrorToast("Saat Bilgisi Secilmedi");
      return false;
    }
    return true;
  }

  Future<void> createNewGroup(BuildContext context) async {
    final NavigatorState navigator = Navigator.of(context);
    final bool isValidated = _validateNewGroup();
    if (isValidated == false) return;
    final int numberOfWeeks = int.parse(numberOfWeek.text.trim());
    final TGroupModel group = TGroupModel(
      groupCategory: chosenCategory.value,
      therapistId: userId,
      therapistHelperId: '',
      therapistName: localManager.getStringValue(LocalManagerKeys.name),
      therapistHelperName: chosenSecTherapist.value,
      name: groupNameController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),
      hasHelperTherapistAccepted: false,
      numberOfSessions: int.parse(numberOfSession.text.trim()),
      numberOfWeeks: int.parse(numberOfWeek.text.trim()),
      participantsId: [],
    );
    //page loading icin buradan yazabilirsin

    final int millisecondsInWeek = 604800000;

    bool isSuccess = true;

    final CreatedIdResponse? createGroupIdResponse =
        await tGroupService.createGroup(group);
    //sonra tekrar false
    if (createGroupIdResponse == null) {
      flutterErrorToast('could not create group');
      return;
    }

    for (int i = 0; i < numberOfWeeks; i++) {
      final Timestamp newWeeksGroupSessionTime =
          Timestamp.fromMillisecondsSinceEpoch(
              group.dateTime!.millisecondsSinceEpoch +
                  millisecondsInWeek * (i + 1));

      final TGroupSessionModel groupSession = TGroupSessionModel(
        therapistId: group.therapistId,
        therapistHelperId: group.therapistHelperId,
        dateTime: newWeeksGroupSessionTime,
        isFinished: false,
        groupId: createGroupIdResponse.id,
        therapistHelperName: group.therapistHelperName,
        therapistName: group.therapistName,
      );

      final CreatedIdResponse? idResponse =
          await tGroupService.createGroupSession(groupSession);
      if (idResponse == null) {
        isSuccess = false;
        break;
      }
    }

    if (isSuccess == false) {
      flutterErrorToast('could not create group Sessions');
      return;
    }

    navigationManager.maybePop(navigator);
  }

  //grup eklmee kismi icin controller
  var isSecTherapistElectionOpen = false.obs;
  var chosenSecTherapist = "Yok".obs;
  var isSecTherapistChosen = false.obs;

  void changeChosenSecTherapist(String name) {
    isSecTherapistChosen.value = true;
    chosenSecTherapist.value = name;
  }

  void changeSecTherapistElection() {
    isSecTherapistElectionOpen.value = !isSecTherapistElectionOpen.isTrue;
  }

  var isDayElectionOpen = false.obs;

  void changeDayElection() {
    isDayElectionOpen.value = !isDayElectionOpen.isTrue;
  }

  void changeChoosenDay(String day) {
    chosenDay = RxString(day);
  }

  var chosenDay = "Gun Seciniz".obs;

  var isParticipantElectionOpen = false.obs;

  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }

  Future<void> setRandomUser() async {
    final UserModel? randomTherapist =
        await tGroupService.findRandomTherapistHelper();
    print(randomTherapist?.toJson());
  }

  //tgroup controllerdan gelenler
  RxString chosenHour = '12'.obs;

  RxString chosenMinutes = '00'.obs;

  void chooseGroupTherapyTime(bool isHour, int value) {
    String valueAsString = value.toString();
    if (valueAsString.length < 2) {
      valueAsString = '0${value.toString()}';
    }
    if (isHour)
      chosenHour.value = valueAsString;
    else
      chosenMinutes.value = valueAsString;
  }

  RxString chosenCategory = ''.obs;
  RxBool isDropDownClicked = false.obs;
  void callBack(String chosenInComponent) {
    chosenCategory.value = chosenInComponent;
    print(chosenCategory);
  }

  void showChoosingTimeDialog() {
    Get.dialog(AlertDialog(
      title: ScrollableTime(
        chooseHourFunction: (value) => chooseGroupTherapyTime(true, value),
        chooseMinuteFunction: (value) => chooseGroupTherapyTime(false, value),
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
  }

  //seans ve hafta sayisi
  TextEditingController numberOfSession =
      TextEditingController(); //nasil obs olacak
  TextEditingController numberOfWeek = TextEditingController();

  var isCircularIndicatorOpen = false.obs;

  changeCircularIndicatorValue() {
    isCircularIndicatorOpen.value = !isCircularIndicatorOpen.value;
  }
}
