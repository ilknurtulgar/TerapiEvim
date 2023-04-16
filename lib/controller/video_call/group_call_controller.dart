import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videosdk/videosdk.dart';

import '../../core/extension/context_extension.dart';
import '../../model/common/video_call/video_call_token_model.dart';
import '../../screen/common/home/main_home.dart';
import '../base/base_controller_2.dart';
import 'base_video_call_controller.dart';

class GroupCallController extends BaseController2 with BaseVideoCallController {

  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void setToken(VideoCallTokenModel token) => currentToken = token;

  @override
  void onInit() {
    // Create instance of Room (Meeting)
    room = VideoSDK.createRoom(
      roomId: currentToken.meetingId,
      token: currentToken.token,
      displayName: "Hello World",
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      maxResolution: 'hd',
      defaultCameraIndex: 1,
    );

    setMeetingEventListener(room);

    // Join meeting
    room.join();

    super.onInit();
  }

  var shareAuthority = false.obs;

  var openAllMics = false.obs;

  void setParticipantStreamEvents(Participant participant) {
    participant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        // setState(() => participantVideoStreams[participant.id] = stream);
      }
    });

    participant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video') {
        // setState(() => participantVideoStreams.remove(participant.id));
      }
    });
  }

  void setMeetingEventListener(Room room) {
    setParticipantStreamEvents(room.localParticipant);
    room.on(
      Events.participantJoined,
      (Participant participant) => setParticipantStreamEvents(participant),
    );
    room.on(Events.participantLeft, (String participantId) {
      if (participantVideoStreams.containsKey(participantId)) {
        // setState(() => participantVideoStreams.remove(participantId));
      }
    });
    room.on(Events.roomLeft, () {
      participantVideoStreams.clear();
      controllerContext.pushAndRemoveUntil(const MainHome());
    });
  }

  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }



  void therapistSwitchButtonFunction(bool isToOpenMics, bool value) {
    if (isToOpenMics) {
      openAllMics.value = value;
    } else {
      shareAuthority.value = value;
    }
  }
}
