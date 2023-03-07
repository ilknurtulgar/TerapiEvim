import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/participant/home/home.dart';
import 'package:terapievim/screen/therapist/group/group_add/group_add_view.dart';

class NewActivityScreen extends StatefulWidget {
  const NewActivityScreen({super.key});

  @override
  State<NewActivityScreen> createState() => _NewActivityScreenState();
}

TherapistActivtyController therapistActivtyController = Get.find();

class _NewActivityScreenState extends State<NewActivityScreen> {
  TextEditingController activitynamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => therapistActivtyController.isUpdate.value
                    ? headingtext(false, true, ActivityTextUtil.activityUpdate)
                    : headingtext(false, true, ActivityTextUtil.newActivity),
              ),
              miniHeadings(ActivityTextUtil.eventName, false),
              eventname(),
              miniHeadings(ActivityTextUtil.eventAbout, false),
              eventabout(),
              dateclockrow(),
              dateclocktextfield(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 30),
                child: Obx(
                  () => therapistActivtyController.isUpdate.value
                      ? butterFlyButton(ActivityTextUtil.update, () {})
                      : butterFlyButton(ActivityTextUtil.create, () {}),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  CustomTextField eventname() {
    return CustomTextField(
        isPhoneNumber: false,
        isBig: true,
        textController: activitynamController,
        isPassword: false,
        isRowModel: false);
  }

  Widget eventabout() {
    return textfield(342, 204);
  }

  Row dateclocktextfield() {
    return Row(
      children: [
        Padding(
          padding: AppPaddings.datePadding,
          child: textfield(160, 60),
        ),
        Padding(
          padding: AppPaddings.clockPadding,
          child: textfield(160, 60),
        ),
      ],
    );
  }

  Row dateclockrow() {
    // miniHeading ve container ikisi beraber bir column olarak extract edilecek 2 tanesi yan yana kullanılacak
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        miniHeadings(ActivityTextUtil.date, false),
        // activityname(ActivityTextUtil.date, AppPaddings.startpadding),
        miniHeadings(ActivityTextUtil.clock, true)
        // activityname(ActivityTextUtil.clock, AppPaddings.centerpadding),
      ],
    );
  }

  Widget textfield(double width, double height) {
    return CustomTextField(
        height: height,
        width: width,
        isPhoneNumber: false,
        isBig: true,
        textController: activityTextController,
        isPassword: false,
        isRowModel: false);
  }

  Padding activityname(String activityheading, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          activityheading,
          style: AppTextStyles.groupTextStyle(false),
        ),
      ),
    );
  }
}

Widget butterFlyButton(String buttonname, Function() onTap) {
  return Padding(
    padding: AppPaddings.generalPadding,
    child: Align(
      alignment: Alignment.bottomRight,
      child: CustomButton(
          container: AppContainers.containerButton(true),
          textColor: AppColors.white,
          onTap: onTap,
          text: buttonname),
    ),
  );
}
