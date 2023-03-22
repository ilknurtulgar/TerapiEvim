import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/group/metots/new_metot.dart';
import 'package:terapievim/screen/therapist/group/therapist_about.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/person.dart';

// ignore: must_be_immutable
class GroupInformation extends StatelessWidget {
  GroupInformation({super.key});
  TherapistGroupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    List<PersonMin> participantRow = [
      person("Ali Kiran", context),
      person("Yasemin Atmaca", context),
      person("Kerem Bursin", context),
      person("Osman Yigit", context),
      person("Ali Kiran", context)
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                heading(context),
                miniHeadings(GroupTextUtil.upcomingMeetingText, false),
                meeting(),
                miniHeadings(GroupTextUtil.groupsInformationText, false),
                navMethod(DemoInformation.secTherapist, () {
                  context.push(const TherapistProfile(isSecTherapist: true));
                }),
                Election(
                    election:
                        ControllerElection.therapistGroupControllerParticipant,
                    firstRow: Obx(() => SizedBox(
                          child: participants(),
                        )),
                    rows: participantRow),
                navMethod(DemoInformation.methods, () {
                  //method sayfasina gidecek
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SeminarMin participants() {
    return SeminarMin(
      isBorderPurple: true,
      onTap: () {
        controller.changeParticipantElection();
      },
      row: RowModel(
        text: GroupTextUtil.participantsText,
        textStyle: AppTextStyles.aboutMeTextStyle(false),
        leadingIcon: IconUtility.groupsIcon,
        isAlignmentBetween: true,
        trailingIcon: controller.isParticipantElectionOpen.isTrue
            ? IconUtility.arrowUp
            : IconUtility.arrowDown,
      ),
    );
  }

  ActivityBox meeting() {
    return ActivityBox(
        istwobutton: false,
        containerModel: AppContainers.containerButton(false),
        buttonText: GroupTextUtil.startText,
        arowModel: DemoInformation.row2,
        isactivity: true,
        clockModel: DemoInformation.clockRow);
  }

  Padding navMethod(RowModel row, Function() func) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: SeminarMin(isBorderPurple: true, onTap: func, row: row),
    );
  }

  Widget heading(BuildContext context) {
    return rowView(
        RowModel(
            leadingIcon: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: IconUtility.back),
            text: DemoInformation.tmpGroupName,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: true,
            trailingIcon: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_document),
                  onPressed: () {
                    context.push(const NewMetot());

                    //new Metot sayfasina godocek
                  },
                ),
                IconButton(
                  icon: IconUtility.deleteIcon,
                  onPressed: () {
                    deleteGroupDialog(context);
                  },
                )
              ],
            )),
        AppPaddings.componentPadding);
  }

  Future<void> deleteGroupDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(GroupTextUtil.deleteGroupConfirmText),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(GroupTextUtil.deleteGroupWarningText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(GroupTextUtil.cancelText),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(GroupTextUtil.deleteText),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Widget miniHeadings(String name, bool isInMiddle) {
    return rowView(
        RowModel(
            text: name,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: false),
        AppPaddings.miniHeadingPadding(isInMiddle));
  }

  PersonMin person(String name, BuildContext context) {
    TherapistGroupController controller = Get.find();
    return PersonMin(
        isBorderPurple: true,
        onTap: () {
          deleteParticipantDialog(context, name, controller);
        },
        row: UiBaseModel.groupInfoPerson(name));
  }

  Future<String?> deleteParticipantDialog(
      BuildContext context, String name, TherapistGroupController controller) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(name + GroupTextUtil.deleteParticipantText),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text(GroupTextUtil.cancelText),
          ),
          TextButton(
            onPressed: () {
              //participant silinecek

              Get.back();
            },
            child: Text(GroupTextUtil.deleteText),
          ),
        ],
      ),
    );
  }
}
