import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/buttons/election.dart';
import 'package:terapievim/core/base/component/group/choosing_time_group_therapy.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

class GroupAddView extends StatelessWidget {
  const GroupAddView({super.key});

  @override
  Widget build(BuildContext context) {
    TherapistGroupController controller = Get.put(TherapistGroupController());
    TextEditingController groupNameController = TextEditingController();

    //gecici

    List<PersonMin> days = [
      day(GroupTextUtil.monday),
      day(GroupTextUtil.tuesday),
      day(GroupTextUtil.wednesday),
      day(GroupTextUtil.thursday),
      day(GroupTextUtil.friday),
      day(GroupTextUtil.saturday),
      day(GroupTextUtil.sunday),
    ];

    List<PersonMin> persons = [
      //cikartamiyorum person widgeti kullanildi cunku
      person("Nihat Turgutlu", context),
      person("Mikasa Ackerman", context),
      person("Eren Jeager", context),
      person("Levi Ackerman", context)
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            rowView(
                RowModel(
                    text: GroupTextUtil.addGroupText,
                    textStyle: AppTextStyles.heading(false),
                    isAlignmentBetween: true,
                    trailingIcon: IconButton(
                      icon: IconUtility.close,
                      onPressed: () {
                        context.pop();

                        //geri donus yapmasi lazim
                      },
                    )),
                AppPaddings.appBarPadding),
            miniHeadings(GroupTextUtil.groupNameText, false),
            CustomTextField(
                isPhoneNumber: false,
                isBig: true,
                textController: groupNameController,
                isPassword: false,
                isRowModel: false),
            miniHeadings(GroupTextUtil.secondTherapistText, false),
            Election(
                election:
                    ControllerElection.therapistGroupControllerSecTherapist,
                firstRow: secTherapist(),
                rows: persons),
            button(controller, false),
            miniHeadings(GroupTextUtil.meetDayText, false),
            miniHeadings(GroupTextUtil.dayText, true),
            Election(
                election: ControllerElection.therapistGroupControllerDay,
                firstRow: dayRow(),
                rows: days),
            miniHeadings(GroupTextUtil.timeText, true),
            Padding(
              padding: AppPaddings.tGroupAddTimeChoosePadding,
              child: ChoosingTimeGroupTherapy(),
            ),
            button(controller, true)
          ],
        )),
      ),
    );
  }

  Obx dayRow() {
    TherapistGroupController controller = Get.find();
    return Obx(
      () => SizedBox(
          child: SeminarMin(
              onTap: () {
                controller.changeDayElection();
              },
              row: RowModel(
                  text: controller.choosenDay.value,
                  textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
                  isAlignmentBetween: true,
                  trailingIcon: controller.isDayElectionOpen.isTrue
                      ? IconUtility.arrowUp
                      : IconUtility.arrowDown))),
    );
  }

  Obx secTherapist() {
    TherapistGroupController controller = Get.find();
    return Obx(
      () => SizedBox(
        child: SeminarMin(
            onTap: () {
              controller.changeSecTherapistElection();
            },
            row: RowModel(
              text: controller.choosenSecTherapist.value,
              textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
              isAlignmentBetween: true,
              leadingIcon: controller.isSecTherapistChoosed.isTrue
                  ? CustomCircleAvatar(
                      imagePath: DemoInformation.imagePath,
                      big: false,
                      shadow: false)
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
            )),
      ),
    );
  }

  Padding button(TherapistGroupController controller, bool isLastButton) {
    return Padding(
      padding: isLastButton
          ? AppPaddings.tGroupFirstButtonPadding
          : AppPaddings.tGroupLastButtonPadding,
      child: CustomButton(
          container: isLastButton
              ? AppContainers.purpleButtonContainer(140)
              : AppContainers.lightPurpleButtonContainer(173),
          textColor: isLastButton ? AppColors.white : AppColors.meteorite,
          onTap: () {
            if (isLastButton) {
            } else {
              controller.changeChoosenSecTherapist("Eren Jaeger");
            }
          },
          text: isLastButton
              ? GroupTextUtil.createGroupText
              : GroupTextUtil.newSecTherapistText),
    );
  }

  PersonMin person(String therapistName, BuildContext context) {
    TherapistGroupController controller = Get.find();
    Icon trailingIcon = IconUtility.emailIcon;

    return PersonMin(
        padding: AppPaddings.tGroupPersonPadding,
        borderColor: AppColors.cornFlowerBlue,
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

  Future<String?> secTherapistChooseDialog(BuildContext context,
      String therapistName, TherapistGroupController controller) {
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

  PersonMin day(String dayName) {
    TherapistGroupController controller = Get.find();
    return PersonMin(
        height: 48,
        padding: AppPaddings.tGroupPersonPadding,
        onTap: () {
          controller.changeChoosenDay(dayName);
          controller.changeDayElection();
        },
        row: RowModel(
            isAlignmentBetween: false,
            text: dayName,
            textStyle: AppTextStyles.buttonTextStyle(AppColors.black)));
  }
}

Widget miniHeadings(String name, bool isInMiddle) {
  return rowView(
      RowModel(
          text: name,
          textStyle: AppTextStyles.heading(false),
          isAlignmentBetween: false),
      AppPaddings.miniHeadingPadding(isInMiddle));
}
