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
    date = DateTime.now();

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
    controllerContext = context;
  }

  TextEditingController groupNameController = TextEditingController();
  late DateTime date;
  bool _validateNewGroup() {
    if (groupNameController.text.isEmpty) {
      flutterErrorToast("isim bos");
      return false;
    }
    if (chosenCategory.value.isEmpty) {
      flutterErrorToast("Kategori Bos");
      return false;
    }
    if (helperTherapist.isNull) {
      flutterErrorToast("Yardimci Terapist Secilmedi");
      return false;
    }
    if (chosenDay == "Yok") {
      flutterErrorToast("Terapi Gunu Secilmedi");
      return false;
    }
    if (numberOfWeek.text.isEmpty) {
      //integer olup olmadigi bakilmali
      flutterErrorToast("Kac Hafta terapi yapilacagi secilmedi");
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
      therapistHelperId: helperTherapist?.id,
      therapistName: localManager.getStringValue(LocalManagerKeys.name),
      therapistHelperName: helperTherapist?.name,
      name: groupNameController.text.trim(),
      dateTime: Timestamp.fromDate(date),
      hasHelperTherapistAccepted: false,
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
  var isSecTherapistChosen = false.obs;
  List<UserModel> therapists = <UserModel>[].obs; //userModel listesi alinmali

  void changeSecTherapistElection() {
    isSecTherapistElectionOpen.value = !isSecTherapistElectionOpen.isTrue;
  }

  late UserModel? helperTherapist;
  Future<void> setRandomUser() async {
    helperTherapist = await tGroupService.findRandomTherapistHelper();
    isSecTherapistChosen.value = true;
  }

  var isDayElectionOpen = false.obs;

  void changeDayElection() {
    isDayElectionOpen.value = !isDayElectionOpen.isTrue;
  }

  void changeChoosenDay(String day, int index) {
    if (index > date.weekday) {
      //o haftanin ileriki gunlerinde
      date = date.copyWith(day: date.day + index - date.weekday);
    } else if (index == date.weekday) {
      //haftaya o gun
      date = date.copyWith(day: date.day + 7);
    } else {
      //haftaya bugunden once
      date = date.copyWith(day: date.day + 7 - (date.weekday - index));
    }

    date = date.copyWith(
        hour: int.parse(chosenHour.value),
        minute: int.parse(chosenMinutes.value));

    chosenDay = RxString(day);
  }

  var chosenDay = "Gun Seciniz".obs;
  var choosenDayIndex = 0.obs;

  var isParticipantElectionOpen = false.obs;

  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
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

  TextEditingController numberOfWeek = TextEditingController();

  var isCircularIndicatorOpen = false.obs;

  changeCircularIndicatorValue() {
    isCircularIndicatorOpen.value = !isCircularIndicatorOpen.value;
  }
}
