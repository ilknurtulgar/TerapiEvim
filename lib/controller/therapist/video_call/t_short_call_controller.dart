import 'package:flutter/src/widgets/framework.dart';
import 'package:videosdk/src/core/room/participant.dart';
import 'package:videosdk/src/core/room/room.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../video_call/base_video_call_controller.dart';

class TShortCallController extends BaseVideoCallController{

  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void setToken(VideoCallTokenModel token) => currentToken = token;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setMeetingEventListener(Room room) {
    // TODO: implement setMeetingEventListener
  }

  @override
  void setParticipantStreamEvents(Participant participant) {
    // TODO: implement setParticipantStreamEvents
  }

}
