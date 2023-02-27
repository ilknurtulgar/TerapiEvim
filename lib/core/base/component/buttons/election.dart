import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/t_message_controller.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/screen/therapist/message/message.dart';

import '../../models/row_model.dart';
import '../../util/base_utility.dart';
import '../activtiy/seminers.dart';
import '../group/person.dart';
import '../profile/image/custom_circle_avatar.dart';

class Election extends StatelessWidget {
  const Election(
      {super.key,
      required this.election,
      required this.changeElection,
      required this.firstRow,
      required this.rows});
  final ControllerElection election;
  final Function()? changeElection;
  final RowModel firstRow;
  final List<PersonMin> rows;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            SeminarMin(onTap: changeElection, row: firstRow),
            election.value
                ? SizedBox(
                    width: 294,
                    child: ListView(
                      shrinkWrap: true,
                      children: rows,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ));
  }
}

enum ControllerElection {
  therapistyMessageController,
  therapistGroupControllerDay,
  therapistGroupControllerSecTherapist
}

extension ControllerTypeExtension on ControllerElection {
  static TherapistGroupController gController = Get.find();
  static TherapistyMessageController mController = Get.find();
  get value {
    switch (this) {
      case ControllerElection.therapistGroupControllerDay:
        return gController.isDayElectionOpen.value;
      case ControllerElection.therapistyMessageController:
        return mController.personvalue.value;
      case ControllerElection.therapistGroupControllerSecTherapist:
        return gController.isSecTherapistElectionOpen.value;
    }
  }
}

enum ValueType { day, person, secTherapist }
