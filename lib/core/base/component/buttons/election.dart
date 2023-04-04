import 'package:flutter/material.dart';

import '../../util/base_utility.dart';
import '../group/person.dart';

class Election extends StatelessWidget {
  const Election({
    super.key,
    required this.election,
    required this.firstRow,
    required this.rows,
  });

  final ControllerElection election;
  final List<PersonMin> rows;
  final Widget firstRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        firstRow,
        election.value
            ? SizedBox(
                width: Responsive.width(SizeUtil.hugeValueWidth, context),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => rows[index],
                  itemCount: rows.length,
                  shrinkWrap: true,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
    // return Obx(() => Column(
    //       children: [
    //         firstRow,
    //         election.value
    //             ? SizedBox(
    //                 width: Responsive.width(SizeUtil.hugeValueWidth, context),
    //                 child: ListView.builder(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   itemBuilder: (context, index) => rows[index],
    //                   itemCount: rows.length,
    //                   shrinkWrap: true,
    //                 ),
    //               )
    //             : const SizedBox.shrink(),
    //       ],
    //     ));
  }
}

enum ControllerElection {
  therapistyMessageController,
  therapistGroupControllerDay,
  therapistGroupControllerSecTherapist,
  therapistGroupControllerParticipant
}

///TODO: extension should be independent from controller
extension ControllerTypeExtension on ControllerElection {
  // static GroupAddController gController = Get.find();
  // static TherapistMessageController mController = Get.find();
  get value {
    switch (this) {
      case ControllerElection.therapistGroupControllerDay:
        // return gController.isDayElectionOpen.value;
        return true;
      case ControllerElection.therapistyMessageController:
        // return mController.personvalue.value;
        return true;
      case ControllerElection.therapistGroupControllerSecTherapist:
      //   return gController.isSecTherapistElectionOpen.value;
      case ControllerElection.therapistGroupControllerParticipant:
        return true; //  return gController.isParticipantElectionOpen.value;
    }
  }
}
