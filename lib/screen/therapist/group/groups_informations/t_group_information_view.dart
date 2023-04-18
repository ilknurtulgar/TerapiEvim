import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/group/t_group_information_controller.dart';
import '../../../../core/base/component/activtiy/seminers.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/group_box.dart';
import '../../../../core/base/component/group/person.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../model/therapist/group/t_group_model.dart';
import '../coping_methods/t_new_coping_method_view.dart';
import 't_profile_about_view.dart';

class TGroupInformationView extends StatelessWidget {
  const TGroupInformationView({super.key, this.currentGroup});

  final TGroupModel? currentGroup;

  @override
  Widget build(BuildContext context) {
    /// TODO: it should be deleted
    List<PersonMin> participantRow = [
      person("Ali Kiran", context),
      person("Yasemin Atmaca", context),
      person("Kerem Bursin", context),
      person("Osman Yigit", context),
      person("Ali Kiran", context)
    ];
    return BaseView<TGroupInformationController>(
        getController: TGroupInformationController(),
        onModelReady: (controller) {
          controller.setCurrentGroup(currentGroup);
        },
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(
              title: controller.currentGroupModel?.name ?? '',
              actions:
                  _appBarActions(context, controller.currentGroupModel?.id),
            ),
            body: ListView(
              padding: AppPaddings.pagePaddingHorizontal,
              children: [
                miniHeadings(GroupTextUtil.upcomingMeetingText, false),
                meeting(),
                miniHeadings(GroupTextUtil.groupsInformationText, false),
                navMethod(DemoInformation.secTherapist, () {
                  context.push(const TProfileView(isSecTherapist: true));
                }),
                Election(
                    isSelectedValue: controller.isParticipantElectionOpen,
                    firstRow: Obx(() => SizedBox(
                          child:
                              participants(controller, participantRow.length),
                        )),
                    rows: participantRow),
                navMethod(DemoInformation.methods, () {
                  //method sayfasina gidecek
                }),
              ],
            ),
          );
        });
  }

  List<Widget> _appBarActions(BuildContext context, String? currentGroupId) {
    return [
      IconButton(
        icon: const Icon(Icons.create_new_folder_outlined),
        onPressed: () {
          if (currentGroup == null) {
            ///TODO : show a message that there is an error
            return;
          }
          context.push(TNewCopingMethodView(groupId: currentGroupId!));
        },
      ),
      IconButton(
        icon: IconUtility.deleteIconOutlined,
        onPressed: () {
          if (currentGroup == null) {
            ///TODO : show a message that there is an error
            return;
          }
          deleteGroupDialog(context, currentGroupId!);
        },
      )
    ];
  }

  SeminarMin participants(
      TGroupInformationController controller, int numberOfParticipants) {
    return SeminarMin(
      isBorderPurple: true,
      onTap: () {
        controller.changeParticipantElection();
      },
      row: RowModel(
        text: GroupTextUtil.participantsText + numberOfParticipants.toString(),
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
        rightButtonTap: () {},
        istwobutton: false,
        containerModel: AppContainers.containerButton(false),
        buttonText: GroupTextUtil.startText,
        arowModel: DemoInformation.row2,
        isactivity: true,
        clockModel: DemoInformation.clockRow(Timestamp.now()));
  }

  Padding navMethod(RowModel row, Function() func) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: SeminarMin(isBorderPurple: true, onTap: func, row: row),
    );
  }

  Future<void> deleteGroupDialog(BuildContext context, String currentGroupId) {
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
                ///TODO: user can delete with currentGroupId from controller
                ///Note: using get.find is Ok, while it is only used in this view
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Widget miniHeadings(String name, bool isInMiddle) {
    return RowView(
      rowModel: RowModel(
          text: name,
          textStyle: AppTextStyles.heading(false),
          isAlignmentBetween: false),
      padding: AppPaddings.miniHeadingPadding(isInMiddle),
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
