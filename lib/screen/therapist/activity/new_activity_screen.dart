import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/home/home.dart';
import 'package:terapievim/screen/therapist/activity/companent/coping_box.dart';

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
              activityname(ActivityTextUtil.eventName, PaddingAdd.startpadding),
              eventname(),
              activityname(
                  ActivityTextUtil.eventAbout, PaddingAdd.startpadding),
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

  Padding eventabout() {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9, top: 10, bottom: 20),
      child: SizedBox(
        width: 350,
        height: 300,
        child: textfield(),
      ),
    );
  }

  Row dateclocktextfield() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: SizedBox(width: 150, height: 52, child: textfield()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(width: 150, height: 52, child: textfield()),
        ),
      ],
    );
  }

  Row dateclockrow() {
    return Row(
      children: [
        activityname(ActivityTextUtil.date, PaddingAdd.startpadding),
        activityname(ActivityTextUtil.clock, PaddingAdd.centerpadding),
      ],
    );
  }

  TextField textfield() {
    return TextField(
      maxLines: 100,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: border(),
          enabledBorder: border()),
    );
  }

  OutlineInputBorder border() {
    return const OutlineInputBorder(
        borderRadius: AppBorderRadius.generalBorderRadius,
        borderSide: BorderSide(
          color: AppColors.dustyGray,
          width: 1,
        ));
  }

  Padding activityname(String activityheading, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.topLeft,
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
