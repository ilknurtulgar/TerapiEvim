import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/participant/home/p_coping_methods_view.dart';

import '../../../../controller/therapist/group/t_group_information_controller.dart';
import '../../../../core/base/component/activtiy/seminers.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/group_box.dart';
import '../../../../core/base/component/group/person.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../model/therapist/group/t_group_model.dart';
import '../coping_methods/t_new_coping_method_view.dart';
import 't_profile_about_view.dart';

class TGroupInformationView extends StatelessWidget {
  const TGroupInformationView({super.key, required this.currentGroup});

  final TGroupModel currentGroup;

  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupInformationController>(
        getController: TGroupInformationController(),
        onModelReady: (controller) {
          controller.setContext(context);
          controller.setCurrentGroup(currentGroup);
        },
        onPageBuilder: (context, controller) {
          return SafeArea(
            top: false,
            child: Scaffold(
              appBar: MyAppBar(
                title: controller.currentGroup?.name ?? EmptyTextUtil.emptyText,
                actions: _appBarActions(
                    context, controller.currentGroup?.id, controller),
              ),
              body: ListView(
                padding: AppPaddings.pagePaddingHorizontal,
                children: [
                  miniHeadings(GroupTextUtil.upcomingMeetingText, false),
                  meeting(controller),
                  miniHeadings(GroupTextUtil.groupsInformationText, false),
                  Obx(
                    () => navMethod(
                        row(controller, GroupTextUtil.secondTherapistText,
                            controller.helperTherapistName.value), () {
                      context.push(TAboutProfileView(
                        isSecTherapist: true,
                        groupId: controller.currentGroup?.id ?? '',
                      ));
                    }),
                  ),
                  Obx(() =>  Election(
                        isSelectedValue: controller.isParticipantElectionOpen,
                        firstRow: SizedBox(
                              child: participants(
                                  controller, controller.participants.length),
                            ),
                        rows: controller.participants
                            .map((participant) => person(participant.name!,
                                participant.imageUrl??"", context))
                            .toList()),
                  ),
                  navMethod(DemoInformation.methods, () {
                    context.push(PCopingMethodsView());
                  }),
                  hugeSizedBox()
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.meteorite,
                  onPressed: () async {
                    await controller.startIsolatedCall();
                  },
                  child: Icon(Icons.directions_run)),
            ),
          );
        });
  }

  RowModel row(
      TGroupInformationController controller, String definition, String name) {
    return RowModel(
      isAlignmentBetween: true,
      leadingIcon: IconUtility.personIcon,
      text: definition,
      textStyle: AppTextStyles.aboutMeTextStyle(false),
      text2: name,
      textStyle2: AppTextStyles.groupTextStyle(true),
      trailingIcon: IconUtility.forward,
    );
  }

  List<Widget> _appBarActions(BuildContext context, String? currentGroupId,
      TGroupInformationController controller) {
    return [
      IconButton(
        icon: const Icon(Icons.create_new_folder_outlined),
        onPressed: () {
          if (currentGroup == null) {
            errorDialog(context);
            return;
          }
          context.push(TNewCopingMethodView(groupId: currentGroupId!));
        },
      ),
      IconButton(
        icon: IconUtility.deleteIconOutlined,
        onPressed: () {
          if (currentGroup == null) {
            errorDialog(context);
            return;
          }
          deleteGroupDialog(context, currentGroupId!, controller);
        },
      )
    ];
  }
  Widget participants(
      TGroupInformationController controller, int numberOfParticipants) {
    return Obx(() =>  SeminarMin(
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
      ),
    );
  }

  Widget meeting(TGroupInformationController controller) {
    return Obx(
      () => ActivityBox(
          rightButtonTap: () {
            controller.onGroupSessionStarted();
          },
          istwobutton: false,
          containerModel: AppContainers.containerButton(false),
          buttonText: GroupTextUtil.startText,
          arowModel: RowModel(
            isAlignmentBetween: true,
            leadingIcon: IconUtility.personIcon,
            text: GroupTextUtil.secondTherapistText,
            textStyle: AppTextStyles.groupTextStyle(false),
            text2: controller.helperTherapistName.value,
            textStyle2: AppTextStyles.groupTextStyle(true),
          ),
          isactivity: true,
          clockModel: RowModel(
            leadingIcon: IconUtility.clockIcon,
            text: controller.meetingTime.value,
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: true,
          )),
    );
  }

  Padding navMethod(RowModel row, Function() func) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: SeminarMin(isBorderPurple: true, onTap: func, row: row),
    );
  }

  Future<void> deleteGroupDialog(BuildContext context, String currentGroupId,
      TGroupInformationController controller) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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
                controller.deleteGroup();
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

  PersonMin person(String name, String imagePath, BuildContext context) {
    return PersonMin(
        isBorderPurple: true,
        onTap: () {
          deleteParticipantDialog(context, name);
        },
        row: RowModel(
            text: name,
            leadingIcon: CustomCircleAvatar(
                big: false, imagePath: imagePath, shadow: false),
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: true,
            trailingIcon: IconUtility.deleteIcon));
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
              //participant silme

              Get.back();
            },
            child: Text(GroupTextUtil.deleteText),
          ),
        ],
      ),
    );
  }

  errorDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Hata olustu uygulamayi kapatip aciniz"),
      ),
    );
  }
}
