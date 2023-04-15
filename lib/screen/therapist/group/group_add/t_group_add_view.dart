import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/therapist/group/t_group_add_controller.dart';
import '../../../../core/base/component/activtiy/seminers.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/choosing_time_group_therapy.dart';
import '../../../../core/base/component/group/person.dart';
import '../../../../core/base/component/login/custom_textfield.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/widget/common/group/mini_headings.dart';

class TGroupAddView extends StatelessWidget {
  TGroupAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupAddController>(
        getController: TGroupAddController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(
              automaticallyImplyLeading: false,
              title: GroupTextUtil.addGroupText,
              actions: [
                IconButton(
                  icon: IconUtility.close,
                  onPressed: () {
                    context.pop();
                  },
                )
              ],
            ),
            body: ListView(
              padding: AppPaddings.pagePadding,
              children: [
                MiniHeading(
                    name: GroupTextUtil.groupNameText,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                CustomTextField(
                    isOne: true,
                    isBig: true,
                    textController: controller.groupNameController,
                    isRowModel: false),
                MiniHeading(
                    name: GroupTextUtil.groupCategory,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                Election(
                    firstRow: category(controller),
                    rows: categories(controller),
                    isSelectedValue: controller.isGroupCategoryElectionOpen),
                MiniHeading(
                    name: GroupTextUtil.secondTherapistText,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                Election(
                    isSelectedValue: controller.isSecTherapistElectionOpen,
                    firstRow: secTherapist(controller),
                    rows: persons(controller, context)),
                button(context, controller, false),
                MiniHeading(
                    name: "Hafta Sayisi",
                    isInMiddle: false,
                    isAlignedInCenter: false),
                CustomTextField(
                    isBig: true,
                    textController: controller.numberOfWeek,
                    isRowModel: false,
                    isOne: true),
                MiniHeading(
                    name: "Seans Sayisi",
                    isInMiddle: false,
                    isAlignedInCenter: false),
                CustomTextField(
                    isBig: true,
                    textController: controller.numberOfSession,
                    isRowModel: false,
                    isOne: true),
                MiniHeading(
                    name: GroupTextUtil.meetDayText,
                    isAlignedInCenter: false,
                    isInMiddle: false),
                MiniHeading(
                    name: GroupTextUtil.dayText,
                    isInMiddle: true,
                    isAlignedInCenter: false),
                Election(
                    isSelectedValue: controller.isDayElectionOpen,
                    firstRow: dayRow(controller),
                    rows: days(controller)),
                MiniHeading(
                    name: GroupTextUtil.timeText,
                    isInMiddle: true,
                    isAlignedInCenter: false),
                Obx(
                  () => ChoosingTimeGroupTherapy(
                    onTap: () => controller.showChoosingTimeDialog(),
                    hour: controller.chosenHour.value,
                    minutes: controller.chosenMinutes.value,
                  ),
                ),
                button(context, controller, true)
              ],
            ),
          );
        });
  }

  Obx dayRow(TGroupAddController controller) {
    return Obx(
      () => SizedBox(
          child: SeminarMin(
              onTap: () {
                controller.changeDayElection();
              },
              row: dayRowModel(controller))),
    );
  }

  RowModel dayRowModel(TGroupAddController controller) {
    return RowModel(
        text: controller.choosenDay.value,
        textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
        isAlignmentBetween: true,
        trailingIcon: controller.isDayElectionOpen.isTrue
            ? IconUtility.arrowUp
            : IconUtility.arrowDown);
  }

  Obx secTherapist(TGroupAddController controller) {
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

  Obx category(TGroupAddController controller) {
    return Obx(
      () => SizedBox(
        child: SeminarMin(
            onTap: () {
              controller.changeGroupCategoryElection();
              ;
            },
            row: RowModel(
              text: controller.GroupCategoryName.value,
              isAlignmentBetween: true,
              textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
              trailingIcon: controller.isGroupCategoryElectionOpen.value
                  ? IconUtility.arrowUp
                  : IconUtility.arrowDown,
            )),
      ),
    );
  }

  RowModel secTherapistRowModel(TGroupAddController controller) {
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
      BuildContext context, TGroupAddController controller, bool isLastButton) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Align(
        alignment: Alignment.center,
        child: CustomButton(
            container: isLastButton
                ? AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth)
                : AppContainers.lightPurpleButtonContainer(
                    SizeUtil.mediumValueWidth, true),
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
      ),
    );
  }

  PersonMin person(String therapistName, BuildContext context,
      TGroupAddController controller) {
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

  List<PersonMin> persons(
      TGroupAddController controller, BuildContext context) {
    return [
      //cikartamiyorum person widgeti kullanildi cunku
      person("Nihat Turgutlu", context, controller),
      person("Mikasa Ackerman", context, controller),
      person("Eren Jeager", context, controller),
      person("Levi Ackerman", context, controller)
    ];
  }

  PersonMin groupCategory(String name, TGroupAddController controller) {
    return PersonMin(
      onTap: () {
        controller.changeGroupCategory(name);
        controller.changeGroupCategoryElection();
      },
      isBorderPurple: false,
      row: RowModel(
          text: name,
          textStyle: AppTextStyles.groupTextStyle(true),
          isAlignmentBetween: false),
    );
  }

  List<PersonMin> categories(TGroupAddController controller) {
    return [
      groupCategory("Depresyon", controller),
      groupCategory("Anksiyete", controller),
      groupCategory("Yeme Bozuklugu", controller),
      groupCategory("Psikotik", controller),
      groupCategory("Otizm", controller),
    ];
  }

  Future<String?> secTherapistChooseDialog(BuildContext context,
      String therapistName, TGroupAddController controller) {
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

  PersonMin day(String dayName, TGroupAddController controller) {
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

  List<PersonMin> days(TGroupAddController controller) {
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
