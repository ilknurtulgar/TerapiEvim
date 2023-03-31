import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/group/group_add/group_add_view.dart';

import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/models/row_model.dart';
import '../../../service/model/common/activity/t_activity_model.dart';

class NewActivityScreen extends StatefulWidget {
  const NewActivityScreen({super.key, this.activity});

  final TActivityModel? activity;

  @override
  State<NewActivityScreen> createState() => _NewActivityScreenState();
}

TherapistActivityController therapistActivityController = Get.find();

class _NewActivityScreenState extends State<NewActivityScreen> {
  @override
  void initState() {
    if (widget.activity != null) {
      therapistActivityController.activitynamController.text =
          widget.activity?.title ?? '';
      therapistActivityController.activitydescriptionController.text =
          widget.activity?.description ?? '';

      ///TODO handle others controllers
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              Obx(
                () => therapistActivityController.isUpdate.value
                    ? secappview(UiBaseModel.secRowModel(closeIcon(() {
                        context.pop();
                      }), ActivityTextUtil.update))
                    : secappview(UiBaseModel.secRowModel(closeIcon(() {
                        context.pop();
                      }), ActivityTextUtil.newActivity)),
              ),
              miniHeadings(ActivityTextUtil.eventName, false),
              eventname(),
              miniHeadings(ActivityTextUtil.eventAbout, false),
              eventabout(),
              dateclockrow(),
              dateclocktextfield(),
              Obx(
                () => therapistActivityController.isUpdate.value
                    ? butterFlyButton(ActivityTextUtil.update, () {
                        therapistActivityController.updateActivity(context);
                      })
                    : butterFlyButton(ActivityTextUtil.create, () {
                        therapistActivityController.createActivity(context);
                      }),
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
        textController: therapistActivityController.activitynamController,
        isPassword: false,
        isRowModel: false);
  }

  Widget eventabout() {
    return textfield(
        342, 204, therapistActivityController.activitydescriptionController);
  }

  Row dateclocktextfield() {
    return Row(
      children: [
        Expanded(
            child: textfield(
                160, 60, therapistActivityController.activitydateController)),
        Expanded(
            child: textfield(
                160, 60, therapistActivityController.activitytimeController)),
      ],
    );
  }

  Row dateclockrow() {
    // miniHeading ve container ikisi beraber bir column olarak extract edilecek 2 tanesi yan yana kullanılacak
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: miniHeadings(ActivityTextUtil.date, false)),
        // activityname(ActivityTextUtil.date, AppPaddings.startpadding),
        Expanded(child: miniHeadings(ActivityTextUtil.clock, true))
        // activityname(ActivityTextUtil.clock, AppPaddings.centerpadding),
      ],
    );
  }

  Widget textfield(double width, double height,
      TextEditingController textEditingController) {
    return CustomTextField(
        height: height,
        width: width,
        isPhoneNumber: false,
        isBig: true,
        textController: textEditingController,
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
  return Align(
    alignment: Alignment.bottomRight,
    child: CustomButton(
        container: AppContainers.containerButton(true),
        textColor: AppColors.white,
        onTap: onTap,
        text: buttonname),
  );
}

Widget secappview(RowModel rowModel) {
  return rowView(rowModel, AppPaddings.mediumxPadding);
}
