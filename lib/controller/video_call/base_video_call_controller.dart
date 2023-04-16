import 'package:videosdk/videosdk.dart';

import '../../model/common/video_call/video_call_token_model.dart';

abstract class BaseVideoCallController {
  void setToken(VideoCallTokenModel token);

  late VideoCallTokenModel currentToken;

  late Room room;

  bool micEnabled = true;

  bool camEnabled = true;

  Map<String, Stream?> participantVideoStreams = {};

  void setMeetingEventListener(Room room);

  void setParticipantStreamEvents(Participant participant);
}
