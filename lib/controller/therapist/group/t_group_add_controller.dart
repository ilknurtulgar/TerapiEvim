import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/controller/therapist/activity/i_t_modify_activity_controller.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/core/managers/firebase/firestore/models/created_id_response.dart';

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
    if (groupCategoryName == "Yok") {
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

    final TGroupModel groupModel = TGroupModel(
      groupCategory: groupCategoryName.value,
      therapistId: '',
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

    final CreatedIdResponse? idResponse =
        await tGroupService.createGroup(groupModel);
    //sonra tekrar false
    if (idResponse == null) return;
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

  var isGroupCategoryElectionOpen = false.obs;
  var groupCategoryName = "Yok".obs;

  void changeGroupCategory(String categoryName) {
    groupCategoryName.value = categoryName;
  }

  void changeGroupCategoryElection() {
    isGroupCategoryElectionOpen.value = !isGroupCategoryElectionOpen.value;
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
