import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/video_call/group_call_controller.dart';
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
          () => ListView.builder(
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

              return Padding(
                padding: AppPaddings.smallPersonViewPadding,
                child: VideoCallPerson(
                  whichPage: VideoCallPages.groupCall,
                  name: participantName,
                  videoStream: stream,
                  videoCallViewModel: VideoCallUtility.personSmallView(
                      DemoInformation.participants[index], true, context),
                  onLongPressed: () {
                    // if (isMainTherapist &&
                    //     controller.currentToken.therapistHelperId.isNotEmpty) {
                    controller.sendIsolatedCall(
                        name: participantName,
                        onConfirmed: () {
                          controller.sendParticipantToIsolatedCall(
                              participantId: participantId);
                        });
                    // }
                  },
                  micOnOffFunction: () => controller.onOffFunction(
                      DemoInformation.participants[index].isMicOn),
                  cameraOnOffFunction: () => controller.onOffFunction(
                      DemoInformation.participants[index].isCamOn),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
