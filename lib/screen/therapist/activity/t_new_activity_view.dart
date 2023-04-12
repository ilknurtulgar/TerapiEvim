import 'package:flutter/material.dart';

import '../../../controller/therapist/activity/t_new_activity_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/component/login/custom_textfield.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../screen/therapist/group/group_add/t_group_add_view.dart';

class TNewActivityView extends StatelessWidget {
  const TNewActivityView({super.key, this.activity});

  final TActivityModel? activity;

  @override
  Widget build(BuildContext context) {
    return BaseView<TNewActivityViewController>(
      getController: TNewActivityViewController(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, TNewActivityViewController controller) =>
          Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.newActivity),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                miniHeadings(ActivityTextUtil.eventName, false, false),
                eventName(controller.activityNameController),
                miniHeadings(ActivityTextUtil.eventAbout, false, false),
                eventAbout(controller.activityDescriptionController),
                // dateClockRow(),
                dateClockTextField(
                  controller.activityDateController,
                  controller.activityTimeController,
                ),
                butterFlyButton(ActivityTextUtil.create, () {
                  controller.createActivity();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget eventName(TextEditingController activityNameController) {
    return textField(activityNameController, 2);
  }

  Widget eventAbout(TextEditingController activityDescriptionController) {
    return textField(activityDescriptionController, 10);
  }

  Widget dateClockTextField(TextEditingController activityDateController,
      TextEditingController activityTimeController) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: textField(activityDateController, 2)),
        Expanded(child: textField(activityTimeController, 2)),
      ],
    );
  }

  Row dateClockRow() {
    // miniHeading ve container ikisi beraber bir column olarak extract edilecek 2 tanesi yan yana kullanılacak
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: miniHeadings(ActivityTextUtil.date, false, false)),
        // activityname(ActivityTextUtil.date, AppPaddings.startpadding),
        Expanded(child: miniHeadings(ActivityTextUtil.clock, true, false))
        // activityname(ActivityTextUtil.clock, AppPaddings.centerpadding),
      ],
    );
  }

  Widget textField(TextEditingController textEditingController, int maxLines) {
    return Padding(
      padding: AppPaddings.generalPadding,
      child: CustomTextField(
          isOne: true,
          maxLines: maxLines,
          isBig: true,
          textController: textEditingController,
          isRowModel: false),
    );
  }

  Padding activityName(String activityHeading, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          activityHeading,
          style: AppTextStyles.groupTextStyle(false),
        ),
      ),
    );
  }
}

Align butterFlyButton(String buttonName, Function() onTap) {
  return Align(
    alignment: Alignment.bottomRight,
    child: CustomButton(
        container: AppContainers.containerButton(true),
        textColor: AppColors.white,
        onTap: onTap,
        text: buttonName),
  );
}
