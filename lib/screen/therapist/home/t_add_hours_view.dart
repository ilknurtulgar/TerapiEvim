import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/home/session/t_add_hours_view_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/component/group/choosing_time_group_therapy.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/product/widget/common/profile/utility/textfield_utility.dart';

import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/component/login/custom_textfield.dart';
import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../activity/t_new_activity_view.dart';

class TAddHoursView extends StatelessWidget {
  const TAddHoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TAddHoursViewController>(
      getController: TAddHoursViewController(),
      onPageBuilder: (context, TAddHoursViewController controller) => Scaffold(
        appBar: MyAppBar(
          title: ActivityTextUtil.addNewClock,
        ),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              minheading(ActivityTextUtil.date),
              dateAdd(controller),
              minheading(ActivityTextUtil.addClock),
              clockAddTime(controller),
              minheading(ActivityTextUtil.clocks),
              butterFlyButton(ActivityTextUtil.save, () {})
            ],
          ),
        ),
      ),
    );
  }

  Padding clockAddTime(TAddHoursViewController controller) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => ChoosingTimeGroupTherapy(
                onTap: () {
                  controller.showChoosingTimeDialog();
                },
                hour: controller.chosenHour.value,
                minutes: controller.chosenMinutes.value),
          ),
          CircleAvatar(
            backgroundColor: AppColors.butterflyBush,
            child: IconButton(onPressed: () {}, icon: IconUtility.addIcon),
          )
        ],
      ),
    );
  }

  CustomHeading minheading(String text) {
    return CustomHeading(
      text: text,
      isalignmentstart: true,
      isToggle: false,
      padding: AppPaddings.componentPadding,
    );
  }
}

Padding dateAdd(TAddHoursViewController controller) {
  return Padding(
    padding: AppPaddings.componentPadding,
    child: CustomTextField(
      isOne: true,
      textController: controller.dateAddController,
      onTap: () => choosingBirthday(controller.dateAddController),
      rowModel: RowModel(
          text: "",
          textStyle: const TextStyle(color: AppColors.black),
          text2: 'gg/aa/yyyy',
          isAlignmentBetween: false,
          leadingIcon: IconUtility.calendarIcon),
      isBig: true,
      isRowModel: true,
    ),
  );
}
