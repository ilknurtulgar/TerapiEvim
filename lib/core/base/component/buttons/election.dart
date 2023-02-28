import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/t_message_controller.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import '../../models/row_model.dart';
import '../activtiy/seminers.dart';
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
    return Obx(() => Column(
          children: [
            firstRow,
            // SeminarMin(onTap: changeElection, row: firstRow),
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
