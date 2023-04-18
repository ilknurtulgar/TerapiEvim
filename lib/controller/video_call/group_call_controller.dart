import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videosdk/videosdk.dart';

import '../../core/base/component/video_call/tab/therapist_tab.dart';
import '../../core/base/ui_models/video_call/person_in_call_model.dart';
import '../../core/base/util/base_utility.dart';
import '../../core/base/util/text_utility.dart';
import '../../model/common/video_call/video_call_token_model.dart';
import 'base_video_call_controller.dart';

class GroupCallController extends BaseVideoCallController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
    // _mainController = Get.find();

    super.onInit();
  }

  @override
  void setToken(VideoCallTokenModel token) {
    currentToken = token;

    // Create instance of Room (Meeting)
    room = VideoSDK.createRoom(
      roomId: currentToken.meetingId,
      token: currentToken.token,
      displayName: "Hello World",
      micEnabled: micEnabled.value,
      camEnabled: camEnabled.value,
      maxResolution: 'hd',
      defaultCameraIndex: 1,
    );

    setMeetingEventListener(room);

    // Join meeting
    room.join();
  }

  // late MainController _mainController;

  var shareAuthority = false.obs;

  var openAllMics = false.obs;

  var hasSecondTherapistControl =
      TherapistTabController.SecondTherapistHasNotControl.obs;

  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }

  void therapistSwitchButtonFunction(bool isToOpenMics, bool value,
      {List<PersonInCallModel>? participants}) {
    if (isToOpenMics) {
      openAllMics.value = value;
      if (value)
        participants!.forEach((element) {
          element.isMicOn.value = true;
        });
      else
        participants!.forEach((element) {
          element.isMicOn.value = false;
        });
    } else {
      shareAuthority.value = value;
      if (value)
        hasSecondTherapistControl.value =
            TherapistTabController.SecondTherapistHasControl;
      else
        hasSecondTherapistControl.value =
            TherapistTabController.SecondTherapistHasNotControl;
    }
  }

  void openTherapistTab(List<PersonInCallModel> participants,
      Rx<TherapistTabController> whoHasControl) {
    Get.snackbar('', '',
        padding: EdgeInsets.zero,
        borderRadius: 0,
        margin: EdgeInsets.zero,
        backgroundColor: AppColors.mineShaft,
        titleText: TherapistTab(
          participants: participants,
          whoHasControl: whoHasControl,
        ),
        messageText: const SizedBox.shrink(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(minutes: 1));
  }

  void sendIsolatedCall(String name) {
    Get.dialog(AlertDialog(
      content: Text('$name ${VideoCallTextUtil.sendIsolatedCall}'),
      actions: [
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              VideoCallTextUtil.no,
              style: AppTextStyles.groupTextStyle(false),
            )),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              VideoCallTextUtil.yes,
              style: AppTextStyles.groupTextStyle(false),
            )),
      ],
    ));
  }
}
