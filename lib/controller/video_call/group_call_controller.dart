import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:videosdk/videosdk.dart' as videoCall;

import '../../core/base/component/video_call/tab/therapist_tab.dart';
import '../../core/base/ui_models/video_call/person_in_call_model.dart';
import '../../core/base/util/base_utility.dart';
import '../../core/base/util/text_utility.dart';
import '../../model/common/video_call/video_call_token_model.dart';
import '../../model/participant/video_call/participant_group_call_model.dart';
import '../../model/participant/video_call/therapist_helper_group_call_model.dart';
import '../../product/enum/local_keys_enum.dart';
import '../../screen/common/home/main_home.dart';
import '../../screen/common/video_call/isolated_call/isolated_call_view.dart';
import '../../service/video_call/group_call/group_call_service.dart';
import '../../service/video_call/group_call/i_group_call_service.dart';
import 'base_video_call_controller.dart';

class GroupCallController extends BaseVideoCallController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
    _groupCallService = GroupCallService(vexaFireManager.networkManager);

    super.onInit();
  }

  RxMap<String, dynamic> pGroupCallListener = <String, dynamic>{}.obs;

  late IGroupCallService _groupCallService;

  Stream<DocumentSnapshot<Map<String, dynamic>>>? stream;
  var shareAuthority = false.obs;

  var openAllMics = false.obs;

  var hasSecondTherapistControl =
      TherapistTabController.SecondTherapistHasNotControl.obs;

  @override
  void setToken(VideoCallTokenModel token) {
    currentToken = token;

    // Create instance of Room (Meeting)
    room = videoCall.VideoSDK.createRoom(
      roomId: currentToken.meetingId,
      token: currentToken.token,
      participantId: userId!,
      displayName: localManager.getStringValue(LocalManagerKeys.name),
      micEnabled: micEnabled.value,
      camEnabled: camEnabled.value,
      maxResolution: 'hd',
      defaultCameraIndex: 1,
    );
    // Join meeting
    room.join();

    setMeetingEventListener(room);

    if (currentToken.isTherapist == false &&
        currentToken.isMainTherapist == false) {
      _groupCallService.pInit(
          participantGroupCall: ParticipantGroupCallModel(
        participantId: userId!,
        canCamBeEnabled: true,
        canMicBeEnabled: true,
        isParticipantKicked: false,
        meetingId: currentToken.meetingId,
      ));
      stream = _groupCallService.pSetRoomListener(
        meetingId: currentToken.meetingId,
        participantId: userId!,
      );

      if (stream != null) {
        stream!.listen((event) {
          if (event.data() == null) return;
          final ParticipantGroupCallModel groupCallEvent =
              ParticipantGroupCallModel.fromJson(event.data()!);

          ///Send participant to isolated Video call
          if (groupCallEvent.isParticipantKicked ?? false) {
            pushToIsolatedCall(
                meetingId: groupCallEvent.meetingId!,
                therapistHelperId: currentToken.therapistHelperId,
                isTherapistHelper: false);
          }
        });
      }
    } else if (currentToken.isMainTherapist == false &&
        currentToken.isTherapist == true) {
      _groupCallService.tHelperInit(
          therapistHelperGroupCall: TherapistHelperGroupCallModel(
        therapistHelperId: userId!,
        hasTherapistHelperControl: false,
        meetingId: currentToken.meetingId,
      ));
      stream = _groupCallService.tHelperSetRoomListener(
        meetingId: currentToken.meetingId,
        therapistHelperId: userId!,
      );

      if (stream != null) {
        stream!.listen((event) {
          if (event.data() == null) return;
          final TherapistHelperGroupCallModel groupCallEvent =
              TherapistHelperGroupCallModel.fromJson(event.data()!);

          ///Send participant to isolated Video call
          if (groupCallEvent.isTherapistSendToIsolatedCall ?? false) {
            pushToIsolatedCall(
                meetingId: groupCallEvent.meetingId!,
                therapistHelperId: userId!,
                isTherapistHelper: true);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void pushToIsolatedCall(
      {required String meetingId,
      required bool isTherapistHelper,
      required String therapistHelperId}) {
    leaveRoom();

    controllerContext.pushAndRemoveUntil(IsolatedCallView(
      videoCallToken: VideoCallTokenModel(
          meetingId: meetingId,
          participantId: userId!,
          isTherapist: isTherapistHelper,
          token: '',
          isMainTherapist: isTherapistHelper,
          therapistHelperId: therapistHelperId),
    ));
  }

  void endCallToMainView() {
    leaveRoom();
    controllerContext.pushAndRemoveUntil(MainHome());
  }

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

  void sendIsolatedCall(
      {required String name, required Function() onConfirmed}) {
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
            onPressed: () {
              onConfirmed();
              Get.back();
            },
            child: Text(
              VideoCallTextUtil.yes,
              style: AppTextStyles.groupTextStyle(false),
            )),
      ],
    ));
  }

  Future<void> sendParticipantToIsolatedCall(
      {required String participantId}) async {
    try {} catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error sendParticipantToIsolatedCall',
      );
      rethrow;
    }
  }
}
