import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/group/group_information_controller.dart';
import '../../../../core/base/component/activtiy/seminers.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/group_box.dart';
import '../../../../core/base/component/group/person.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/models/row_model.dart';
import '../../../../core/base/util/base_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../screen/therapist/group/t_therapist_about.dart';
import '../coping_methods/t_new_comping_method.dart';

// ignore: must_be_immutable
class GroupInformation extends StatelessWidget {
  GroupInformation({super.key});

  @override
  Widget build(BuildContext context) {
    List<PersonMin> participantRow = [
      person("Ali Kiran", context),
      person("Yasemin Atmaca", context),
      person("Kerem Bursin", context),
      person("Osman Yigit", context),
      person("Ali Kiran", context)
    ];
    return BaseView<GroupInformationController>(
        getController: GroupInformationController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(
              title: DemoInformation.tmpGroupName,
              actions: _appBarActions(context),
            ),
            body: SafeArea(
              child: ListView(
                padding: AppPaddings.pagePaddingHorizontal,
                children: [
                  miniHeadings(GroupTextUtil.upcomingMeetingText, false),
                  meeting(),
                  miniHeadings(GroupTextUtil.groupsInformationText, false),
                  navMethod(DemoInformation.secTherapist, () {
                    context.push(const TherapistProfile(isSecTherapist: true));
                  }),
                  Election(
                      election: ControllerElection
                          .therapistGroupControllerParticipant,
                      firstRow: Obx(() => SizedBox(
                            child: participants(controller),
                          )),
                      rows: participantRow),
                  navMethod(DemoInformation.methods, () {
                    //method sayfasina gidecek
                  }),
                ],
              ),
            ),
          );
        });
  }

  List<Widget> _appBarActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.create_new_folder_outlined),
        onPressed: () {
          context.push(const TNewCopingMethod());
        },
      ),
      IconButton(
        icon: IconUtility.deleteIconOutlined,
        onPressed: () {
          deleteGroupDialog(context);
        },
      )
    ];
  }

  SeminarMin participants(GroupInformationController controller) {
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
        onButtonTap: () {},
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
          leadingIcon: Container(),
          text: name,
          textStyle: AppTextStyles.heading(false),
          isAlignmentBetween: false),
      AppPaddings.miniHeadingPadding(isInMiddle),
    );
  }

  PersonMin person(String name, BuildContext context) {
    return PersonMin(
        isBorderPurple: true,
        onTap: () {
          deleteParticipantDialog(context, name);
        },
        row: UiBaseModel.groupInfoPerson(name));
  }

  Future<String?> deleteParticipantDialog(BuildContext context, String name) {
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
