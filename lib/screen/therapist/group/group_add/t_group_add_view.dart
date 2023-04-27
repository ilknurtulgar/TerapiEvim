import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/therapist/group/t_group_add_controller.dart';
import '../../../../core/base/component/activtiy/seminers.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/choosing_category.dart';
import '../../../../core/base/component/group/choosing_time_group_therapy.dart';
import '../../../../core/base/component/group/person.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/component/login/custom_textfield.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../model/common/user/user_model.dart';
import '../../../../product/widget/common/group/mini_headings.dart';

class TGroupAddView extends StatelessWidget {
  TGroupAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupAddController>(
        onModelReady: (controller) {
          controller.setContext(context);
        },
        getController: TGroupAddController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(
              automaticallyImplyLeading: false,
              title: GroupTextUtil.addGroupText,
              actions: [
                Obx(
                  () => Container(
                    child: controller.isCircularIndicatorOpen.value
                        ? CircularProgressIndicator()
                        : SizedBox(),
                  ),
                ),
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
                    isPassword: false,
                    isBig: true,
                    textController: controller.groupNameController,
                    isRowModel: false),
                MiniHeading(
                    name: GroupTextUtil.groupCategory,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                groupCategroy(controller),
                MiniHeading(
                    name: GroupTextUtil.secondTherapistText,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                Election(
                    isSelectedValue: controller.isSecTherapistElectionOpen,
                    firstRow: secTherapist(controller),
                    rows: controller.therapists
                        .map((therapist) =>
                            person(therapist, context, controller))
                        .toList()),
                button(context, controller, false),
                MiniHeading(
                    name: "Hafta Sayisi",
                    isInMiddle: false,
                    isAlignedInCenter: false),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    isPassword: false,
                    isBig: true,
                    textController: controller.numberOfWeek,
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

  Obx groupCategroy(TGroupAddController controller) {
    return Obx(
      () => Column(
        children: [
          InkWell(
              onTap: () => controller.isDropDownClicked.value =
                  !controller.isDropDownClicked.value,
              child: Container(
                  height: SizeUtil.generalHeight,
                  decoration: BoxDecoration(
                      borderRadius: AppBorderRadius.generalBorderRadius,
                      color: AppColors.white,
                      border: Border.all(color: AppColors.black)),
                  child: RowView(
                      padding: AppPaddings.rowViewPadding,
                      rowModel: RowModel(
                          text: controller.chosenCategory.value,
                          textStyle: TextStyle(),
                          isAlignmentBetween: false,
                          trailingIcon: controller.isDropDownClicked.value
                              ? IconUtility.arrowUp
                              : IconUtility.arrowDown)))),
          controller.isDropDownClicked.value
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: AppBorderRadius.generalBorderRadius,
                      color: AppColors.white,
                      border: Border.all(color: AppColors.black)),
                  child: ChoosingCategoryForParticipant(
                      isWithIconButton: false,
                      callBack: controller.callBack,
                      onPressed: () {
                        controller.isDropDownClicked.value = false;
                      }),
                )
              : const SizedBox(),
        ],
      ),
    );
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
        text: controller.chosenDay.value,
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

  RowModel secTherapistRowModel(TGroupAddController controller) {
    return RowModel(
      text: controller.helperTherapist?.name ?? EmptyTextUtil.emptyText,
      textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
      isAlignmentBetween: true,
      leadingIcon: controller.isSecTherapistChosen.isTrue
          ? CustomCircleAvatar(
              imagePath: controller.helperTherapist?.imageUrl ??
                  EmptyTextUtil.emptyText,
              big: false,
              shadow: false)
          : const SizedBox.shrink(),
      trailingIcon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          controller.isSecTherapistChosen.isTrue
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

  PersonMin person(UserModel therapist, BuildContext context,
      TGroupAddController controller) {
    Icon trailingIcon = IconUtility.emailIcon;
    return PersonMin(
        isBorderPurple: true,
        onTap: () {
          secTherapistChooseDialog(context, therapist, controller);
          trailingIcon = IconUtility.checkCircleIcon;
        },
        row: RowModel(
            text: therapist.name ?? EmptyTextUtil.emptyText,
            leadingIcon: CustomCircleAvatar(
                big: false,
                imagePath: therapist.imageUrl ?? EmptyTextUtil.emptyText,
                shadow: false),
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: true,
            trailingIcon: trailingIcon));
  }

  // List<PersonMin> persons(
  //     TGroupAddController controller, BuildContext context) {
  //   return [
  //     //cikartamiyorum person widgeti kullanildi cunku
  //     person("Nihat Turgutlu", context, controller),
  //     person("Mikasa Ackerman", context, controller),
  //     person("Eren Jeager", context, controller),
  //     person("Levi Ackerman", context, controller)
  //   ];
  // }

  Future<String?> secTherapistChooseDialog(BuildContext context,
      UserModel helperTherapist, TGroupAddController controller) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(helperTherapist.name ??
            EmptyTextUtil.emptyText + GroupTextUtil.secTherDialogText1),
        content: Text(GroupTextUtil.secTherDialogText2),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text(GroupTextUtil.cancelText),
          ),
          TextButton(
            onPressed: () {
              controller.changeSecTherapistElection();
              //yeski calistigi yardimci terapistlerden sectigini helpertherapist olarak eklenecek
              Get.back();
            },
            child: Text(GroupTextUtil.sendRequestText),
          ),
        ],
      ),
    );
  }

  PersonMin day(String dayName, int index, TGroupAddController controller) {
    return PersonMin(
        onTap: () {
          controller.changeChoosenDay(dayName, index);
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
      day(GroupTextUtil.monday, 0, controller),
      day(GroupTextUtil.tuesday, 1, controller),
      day(GroupTextUtil.wednesday, 2, controller),
      day(GroupTextUtil.thursday, 3, controller),
      day(GroupTextUtil.friday, 4, controller),
      day(GroupTextUtil.saturday, 5, controller),
      day(GroupTextUtil.sunday, 6, controller),
    ];
  }
}
