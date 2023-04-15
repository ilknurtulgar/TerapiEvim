import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videosdk/videosdk.dart';

import '../../../core/extension/context_extension.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../screen/common/home/main_home.dart';
import '../../base/base_controller.dart';

class TGroupCallController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

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
      notification: const NotificationInfo(
        title: "Video SDK",
        message: "Video SDK is sharing screen in the meeting",
        icon: "notification_share", // drawable icon name
      ),
    );

    setMeetingEventListener(room, controllerContext);

    // Join meeting
    room.join();

    super.onInit();
  }

  late VideoCallTokenModel currentToken;

  Map<String, Stream?> participantVideoStreams = {};

  bool micEnabled = true;
  bool camEnabled = true;
  late Room room;

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

  void setMeetingEventListener(Room room, BuildContext context) {
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
      context.pushAndRemoveUntil(const MainHome());
    });
  }

  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }

  var shareAuthority = false.obs;
  var openAllMics = false.obs;

  void therapistSwitchButtonFunction(bool isToOpenMics, bool value) {
    if (isToOpenMics) {
      openAllMics.value = value;
    } else {
      shareAuthority.value = value;
    }
  }
}
