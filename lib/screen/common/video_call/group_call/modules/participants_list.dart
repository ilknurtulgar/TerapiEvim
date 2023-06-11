import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videosdk/src/core/room/stream.dart';

import '../../../../../controller/video_call/group_call_controller.dart';
import '../../../../../core/base/component/toast/toast.dart';
import '../../../../../core/base/component/video_call/container/video_call_person.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../util/utility.dart';

class ParticipantsRow extends StatelessWidget {
  const ParticipantsRow(
      {Key? key, required this.controller, required this.isMainTherapist})
      : super(key: key);
  final GroupCallController controller;
  final bool isMainTherapist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppPaddings.smallHorizontalPadding,
        child: Obx(
          () => _listViewBuilder(),
        ),
      ),
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: controller.participantVideoStreams.values.length,
      itemBuilder: ((context, index) {
        final String participantName =
            controller.participantNames.values.elementAt(index);
        final String participantId =
            controller.participantIds.values.elementAt(index);
        final stream =
            controller.participantVideoStreams.values.elementAt(index);

        if (participantId == controller.userId) {
          return Container();
        }

        return _buildVideoCallPerson(
          participantName: participantName,
          stream: stream,
          index: index,
          context: context,
          participantId: participantId,
        );
      }),
    );
  }

  Widget _buildVideoCallPerson({
    required String participantName,
    Stream? stream,
    required int index,
    required BuildContext context,
    required String participantId,
  }) {
    return Padding(
      padding: AppPaddings.smallPersonViewPadding,
      child: VideoCallPerson(
        whichPage: VideoCallPages.groupCall,
        name: participantName,
        videoStream: stream,
        videoCallViewModel: VideoCallUtility.personSmallView(
            DemoInformation.participants[index], true, context),
        onLongPressed: () {
          if (participantId == controller.currentToken.therapistHelperId) {
            flutterInfoToast(
                'You are trying to send therapist helper to isolated call');
            return;
          }
          if (isMainTherapist &&
              controller.currentToken.therapistHelperId.isNotEmpty) {
            controller.sendIsolatedCall(
                name: participantName, participantId: participantId);
          }
        },
        micOnOffFunction: () => controller
            .onOffFunction(DemoInformation.participants[index].isMicOn),
        cameraOnOffFunction: () => controller
            .onOffFunction(DemoInformation.participants[index].isCamOn),
      ),
    );
  }
}
