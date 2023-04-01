import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/group/group_add_controller.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/choosing_time_group_therapy.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/util/base_model.dart';

class GroupAddView extends StatelessWidget {
  const GroupAddView({super.key});

  @override
  Widget build(BuildContext context) {
    //gecici

    return BaseView<GroupAddController>(
        getController: GroupAddController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                padding: AppPaddings.pagePadding,
                child: Column(
                  children: [
                    rowView(appRow(context), AppPaddings.appBarPadding),
                    miniHeadings(GroupTextUtil.groupNameText, false),
                    CustomTextField(
                        isPhoneNumber: false,
                        isBig: true,
                        textController: controller.groupNameController,
                        isPassword: false,
                        isRowModel: false),
                    miniHeadings(GroupTextUtil.secondTherapistText, false),
                    Election(
                        election: ControllerElection
                            .therapistGroupControllerSecTherapist,
                        firstRow: secTherapist(controller),
                        rows: persons(controller, context)),
                    button(context, controller, false),
                    miniHeadings(GroupTextUtil.meetDayText, false),
                    miniHeadings(GroupTextUtil.dayText, true),
                    Election(
                        election:
                            ControllerElection.therapistGroupControllerDay,
                        firstRow: dayRow(controller),
                        rows: days(controller)),
                    miniHeadings(GroupTextUtil.timeText, true),
                    ChoosingTimeGroupTherapy(),
                    button(context, controller, true)
                  ],
                ),
              )),
            ),
          );
        });
  }

  RowModel appRow(BuildContext context) {
    return UiBaseModel.appBarModel(
        GroupTextUtil.addGroupText,
        IconButton(
          icon: IconUtility.close,
          onPressed: () {
            context.pop();

            //geri donus yapmasi lazim
          },
        ));
  }

  Obx dayRow(GroupAddController controller) {
    return Obx(
      () => SizedBox(
          child: SeminarMin(
              onTap: () {
                controller.changeDayElection();
              },
              row: dayRowModel(controller))),
    );
  }

  RowModel dayRowModel(GroupAddController controller) {
    return RowModel(
        text: controller.choosenDay.value,
        textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
        isAlignmentBetween: true,
        trailingIcon: controller.isDayElectionOpen.isTrue
            ? IconUtility.arrowUp
            : IconUtility.arrowDown);
  }

  Obx secTherapist(GroupAddController controller) {
    return Obx(
      () => SizedBox(
        child: SeminarMin(
            onTap: () {
              controller.changeSecTherapistElection();
            },
            row: secTherapistRowModel(controller)),
      ),
    );
  }

  RowModel secTherapistRowModel(GroupAddController controller) {
    return RowModel(
      text: controller.choosenSecTherapist.value,
      textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
      isAlignmentBetween: true,
      leadingIcon: controller.isSecTherapistChoosed.isTrue
          ? CustomCircleAvatar(
              imagePath: DemoInformation.imagePath, big: false, shadow: false)
          : const SizedBox.shrink(),
      trailingIcon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          controller.isSecTherapistChoosed.isTrue
              ? IconUtility.checkCircleIcon
              : const SizedBox(
                  width: 2,
                ),
          controller.isSecTherapistElectionOpen.value
              ? IconUtility.arrowUp
              : IconUtility.arrowDown,
        ],
      ),
    );
  }

//buttonlari ayristir
  Padding button(
      BuildContext context, GroupAddController controller, bool isLastButton) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: CustomButton(
          container: isLastButton
              ? AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth)
              : AppContainers.lightPurpleButtonContainer(
                  SizeUtil.mediumValueWidth),
          textColor: isLastButton ? AppColors.white : AppColors.meteorite,
          onTap: () async {
            if (!isLastButton) {
              await controller.setRandomUser();
            } else {
              await controller.createNewGroup(context);
            }
          },
          text: isLastButton
              ? GroupTextUtil.createGroupText
              : GroupTextUtil.newSecTherapistText),
    );
  }

  PersonMin person(String therapistName, BuildContext context,
      GroupAddController controller) {
    Icon trailingIcon = IconUtility.emailIcon;
    return PersonMin(
        isBorderPurple: true,
        onTap: () {
          secTherapistChooseDialog(context, therapistName, controller);
          trailingIcon = IconUtility.checkCircleIcon;
        },
        row: RowModel(
            text: therapistName,
            leadingIcon: CustomCircleAvatar(
                big: false,
                imagePath: DemoInformation.imagePath,
                shadow: false),
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: true,
            trailingIcon: trailingIcon));
  }

  List<PersonMin> persons(GroupAddController controller, BuildContext context) {
    return [
      //cikartamiyorum person widgeti kullanildi cunku
      person("Nihat Turgutlu", context, controller),
      person("Mikasa Ackerman", context, controller),
      person("Eren Jeager", context, controller),
      person("Levi Ackerman", context, controller)
    ];
  }

  Future<String?> secTherapistChooseDialog(BuildContext context,
      String therapistName, GroupAddController controller) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(therapistName + GroupTextUtil.secTherDialogText1),
        content: Text(GroupTextUtil.secTherDialogText2),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text(GroupTextUtil.cancelText),
          ),
          TextButton(
            onPressed: () {
              controller.changeChoosenSecTherapist(therapistName);
              controller.changeSecTherapistElection();
              Get.back();
            },
            child: Text(GroupTextUtil.sendRequestText),
          ),
        ],
      ),
    );
  }

  PersonMin day(String dayName, GroupAddController controller) {
    // GroupAddController controller = Get.find();
    return PersonMin(
        onTap: () {
          controller.changeChoosenDay(dayName);
          controller.changeDayElection();
        },
        row: RowModel(
            isAlignmentBetween: false,
            text: dayName,
            textStyle: AppTextStyles.buttonTextStyle(AppColors.black)));
  }

  List<PersonMin> days(GroupAddController controller) {
    return [
      //fonksiyon
      day(GroupTextUtil.monday, controller),
      day(GroupTextUtil.tuesday, controller),
      day(GroupTextUtil.wednesday, controller),
      day(GroupTextUtil.thursday, controller),
      day(GroupTextUtil.friday, controller),
      day(GroupTextUtil.saturday, controller),
      day(GroupTextUtil.sunday, controller),
    ];
  }
}

Widget miniHeadings(String name, bool isInMiddle) {
  return rowView(
      RowModel(
          text: name,
          textStyle: AppTextStyles.heading(false),
          isAlignmentBetween: true),
      AppPaddings.miniHeadingPadding(isInMiddle));
}
