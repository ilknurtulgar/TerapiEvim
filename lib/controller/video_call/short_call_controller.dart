import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/video_call/video_call_token_model.dart';
import 'package:videosdk/videosdk.dart';

import 'base_video_call_controller.dart';

class ShortCallController extends BaseVideoCallController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
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
}
