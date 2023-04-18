import 'package:get/get.dart';
import 'package:videosdk/videosdk.dart';

import '../../core/extension/context_extension.dart';
import '../../model/common/video_call/video_call_token_model.dart';
import '../../screen/common/home/main_home.dart';
import '../base/base_controller_2.dart';

abstract class BaseVideoCallController extends BaseController2 {
  void setToken(VideoCallTokenModel token);

  late VideoCallTokenModel currentToken;

  late Room room;

  RxBool micEnabled = true.obs;

  RxBool camEnabled = true.obs;

  RxMap<String, Stream?> participantVideoStreams = <String, Stream?>{}.obs;

  void setParticipantStreamEvents(Participant participant) {
    participant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        participantVideoStreams[participant.id] = stream;
      }
    });

    participant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video') {
        participantVideoStreams.remove(participant.id);
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
        participantVideoStreams.remove(participantId);
      }
    });
    room.on(Events.roomLeft, () {
      participantVideoStreams.clear();
      controllerContext.pushTrueRootNavigatorAndRemove(const MainHome());
    });
  }

  RxBool triggerMicrophone() {
    micEnabled.value ? room.muteMic() : room.unmuteMic();
    micEnabled.value = !micEnabled.value;
    return micEnabled;
  }

  RxBool triggerCamera() {
    camEnabled.value ? room.disableCam() : room.enableCam();
    camEnabled.value = !camEnabled.value;

    return camEnabled;
  }

  void leaveRoom() {
    room.leave();
  }
}
