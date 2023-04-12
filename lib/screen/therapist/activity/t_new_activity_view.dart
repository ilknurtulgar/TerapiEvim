import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/therapist/activity/t_new_activity_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/choosing_time_group_therapy.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/common/activity/t_activity_model.dart';

import '../../../product/widget/common/button/butterfly_button.dart';
import '../../../product/widget/common/textfield/text_field.dart';

import '../../../product/widget/common/group/mini_headings.dart';

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
                MiniHeading(
                    name: ActivityTextUtil.eventName,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                EventName(
                    activityNameController: controller.activityNameController),
                MiniHeading(
                    name: ActivityTextUtil.eventAbout,
                    isInMiddle: false,
                    isAlignedInCenter: false),
                EventAbout(
                    activityDescriptionController:
                        controller.activityDescriptionController),
                dateClockTextField(
                    controller.activityDateController, controller),
                ButterFlyButton(
                    buttonOnTap: () {
                      controller.createActivity();
                    },
                    buttonName: ActivityTextUtil.create),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dateClockTextField(
    TextEditingController activityDateController,
    TNewActivityViewController controller,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // DateTextField(
        //     textController: controller.activityDateController,
        //     isBig: false,
        //     dateTapped: () => (controller.activityDateController)),
        Expanded(
            child: TextsField(
                textEditingController: activityDateController, maxLines: 2)),
        Obx(
          () => ChoosingTimeGroupTherapy(
              onTap: () {
                controller.showChoosingTimeDialog();
              },
              hour: controller.chosenHour.value,
              minutes: controller.chosenMinutes.value),
        ),
      ],
    );
  }

  Row dateClockRow() {
    // miniHeading ve container ikisi beraber bir column olarak extract edilecek 2 tanesi yan yana kullanılacak
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: MiniHeading(
                name: ActivityTextUtil.date,
                isInMiddle: false,
                isAlignedInCenter: false)),
        // activityname(ActivityTextUtil.date, AppPaddings.startpadding),
        Expanded(
            child: MiniHeading(
                name: ActivityTextUtil.clock,
                isInMiddle: true,
                isAlignedInCenter: false))
        // activityname(ActivityTextUtil.clock, AppPaddings.centerpadding),
      ],
    );
  }
}
