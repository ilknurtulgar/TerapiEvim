import 'package:flutter/material.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:videosdk/videosdk.dart';

import '../../../participant/home/main_home.dart';
import '../modules/meeting_controls.dart';
import '../modules/participant_tile.dart';

class TGroupCallView extends StatefulWidget {
  final String meetingId;
  final String token;

  const TGroupCallView({
    Key? key,
    required this.meetingId,
    required this.token,
  }) : super(key: key);

  @override
  State<TGroupCallView> createState() => _TGroupCallViewState();
}

class _TGroupCallViewState extends State<TGroupCallView> {
  Map<String, Stream?> participantVideoStreams = {};

  bool micEnabled = true;
  bool camEnabled = true;
  late Room room;

  void setParticipantStreamEvents(Participant participant) {
    participant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() => participantVideoStreams[participant.id] = stream);
      }
    });

    participant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() => participantVideoStreams.remove(participant.id));
      }
    });
  }

  void setMeetingEventListener(Room _room, BuildContext context) {
    setParticipantStreamEvents(_room.localParticipant);
    _room.on(
      Events.participantJoined,
      (Participant participant) => setParticipantStreamEvents(participant),
    );
    _room.on(Events.participantLeft, (String participantId) {
      if (participantVideoStreams.containsKey(participantId)) {
        setState(() => participantVideoStreams.remove(participantId));
      }
    });
    _room.on(Events.roomLeft, () {
      participantVideoStreams.clear();
      context.pushAndRemoveUntil(const TerapiEvimLogged());
    });
  }

  @override
  void initState() {
    super.initState();
    // Create instance of Room (Meeting)
    room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: "Yash Chudasama",
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

    setMeetingEventListener(room, context);

    // Join meeting
    room.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...participantVideoStreams.values
                  .map(
                    (e) => ParticipantTile(
                      stream: e!,
                    ),
                  )
                  .toList(),
              MeetingControls(
                onToggleMicButtonPressed: () {
                  micEnabled ? room.muteMic() : room.unmuteMic();
                  micEnabled = !micEnabled;
                },
                onToggleCameraButtonPressed: () {
                  camEnabled ? room.disableCam() : room.enableCam();
                  camEnabled = !camEnabled;
                },
                onLeaveButtonPressed: () => room.leave(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
