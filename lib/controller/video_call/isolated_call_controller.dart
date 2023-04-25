import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videosdk/videosdk.dart';

import '../../core/extension/context_extension.dart';
import '../../model/common/video_call/video_call_token_model.dart';
import '../../screen/common/home/main_home.dart';
import '../../service/video_call/i_short_video_call_service.dart';
import '../../service/video_call/short_video_call_service.dart';
import 'base_video_call_controller.dart';

class IsolatedCallController extends BaseVideoCallController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
    shortCallService = ShortVideoCallService(vexaFireManager.networkManager);

    super.onInit();
  }

  late IShortVideoCallService shortCallService;

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

  @override
  void setMeetingEventListener(Room room) {
    super.setMeetingEventListener(room);
  }

  @override
  void setParticipantStreamEvents(Participant participant) {
    super.setParticipantStreamEvents(participant);
  }

  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }

  @override
  Future<void> leaveRoom() async {
    super.leaveRoom();
    controllerContext.pushTrueRootNavigatorAndRemove(MainHome());
  }

  var isViewPlaceChanged = false.obs;

  changeViewPlaces() {
    // isolated call'da çift tıklayınca terapist ile danışanın görüntü olarak yerlerinin değişmesi fonksiyonu
    isViewPlaceChanged.value = !isViewPlaceChanged.value;
  }
}
