// import 'package:flutter/material.dart';
//
// import '../../../../controller/video_call/group_call_controller.dart';
// import '../../../../core/base/component/video_call/container/video_call_person.dart';
// import '../../../../core/base/util/base_utility.dart';
// import '../../../participant/video_call/util/utility.dart';
//
// class ParticipantsRow extends StatelessWidget {
//   const ParticipantsRow({
//     Key? key,
//     required this.isMainTherapist,
//     required this.videoCallController,
//   }) : super(key: key);
//   final bool isMainTherapist;
//   final GroupCallController videoCallController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: AppPaddings.smallHorizontalPadding,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.zero,
//           itemCount: DemoInformation.participants.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: AppPaddings.smallPersonViewPadding,
//               child: VideoCallPerson(
//                 whichPage: VideoCallPages.groupCall,
//                 videoCallViewModel: VideoCallUtility.personSmallView(
//                     DemoInformation.participants[index], true, context),
//                 onLongPressed: isMainTherapist
//                     ? () => videoCallController.sendIsolatedCall(
//                         "${DemoInformation.participants[index].name} ${DemoInformation.participants[index].surname}")
//                     : null,
//                 micOnOffFunction: () => videoCallController
//                     .onOffFunction(DemoInformation.participants[index].isMicOn),
//                 cameraOnOffFunction: () => videoCallController
//                     .onOffFunction(DemoInformation.participants[index].isCamOn),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
