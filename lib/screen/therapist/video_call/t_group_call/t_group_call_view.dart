import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';

import '../../../../../core/extension/context_extension.dart';
import '../../../../controller/therapist/video_call/t_group_call_controller.dart';
import '../../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../product/widget/common/video_call/participant_tile.dart';
import '../../../common/home/main_home.dart';

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

  void setMeetingEventListener(Room room, BuildContext context) {
    setParticipantStreamEvents(room.localParticipant);
    room.on(
      Events.participantJoined,
      (Participant participant) => setParticipantStreamEvents(participant),
    );
    room.on(Events.participantLeft, (String participantId) {
      if (participantVideoStreams.containsKey(participantId)) {
        setState(() => participantVideoStreams.remove(participantId));
      }
    });
    room.on(Events.roomLeft, () {
      participantVideoStreams.clear();
      context.pushAndRemoveUntil(const MainHome());
    });
  }

  @override
  void initState() {
    super.initState();
    // Create instance of Room (Meeting)
    room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
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

    setMeetingEventListener(room, context);

    // Join meeting
    room.join();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupCallController>(
      getController: TGroupCallController(),
      onPageBuilder: (context, controller) => Scaffold(
        backgroundColor: AppColors.doveGray,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              if (participantVideoStreams.values.isNotEmpty)
                if (participantVideoStreams.values.first!.renderer != null)
                  Positioned.fill(
                    child: ParticipantTile(
                      stream: participantVideoStreams.values.first!,
                      hasPadding: false,
                    ),
                  ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 305,
                    color: Colors.black.withOpacity(0.75),
                  )),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: context.width,
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...participantVideoStreams.values
                            .map(
                              (e) => ParticipantTile2(
                                stream: e!,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: VideoCallButtonsRow(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
