import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/therapist/home/session/t_add_hours_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/choosing_time_group_therapy.dart';
import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/button/butterfly_button.dart';
import '../../../product/widget/common/profile/utility/textfield_utility.dart';
import '../../../product/widget/common/textfield/date_text_field.dart';

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
              _minHeading(ActivityTextUtil.date),
              _dateAdd(controller),
              _minHeading(ActivityTextUtil.addClock),
              clockAddTime(controller),
              _minHeading(ActivityTextUtil.clocks),
              ButterFlyButton(
                  buttonOnTap: () {}, buttonName: ActivityTextUtil.save)
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

  CustomHeading _minHeading(String text) {
    return CustomHeading(
      text: text,
      isalignmentstart: true,
      isToggle: false,
      padding: AppPaddings.componentPadding,
    );
  }
}

DateTextField _dateAdd(TAddHoursViewController controller) {
  return DateTextField(
    textController: controller.dateAddController,
    isBig: true,
    dateTapped: () => choosingBirthday(controller.dateAddController),
  );
}
