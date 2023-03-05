import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/activity/a_filter.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';

class FilterDetails extends StatelessWidget {
  FilterDetails({super.key});
  final ActivityController activityController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            rowView(
                RowModel(
                    text: ActivityTextUtil.psychologist,
                    textStyle: AppTextStyles.normalTextStyle("big", false),
                    leadingIcon: IconButton(
                        onPressed: () {}, icon: IconUtility.chevronIcon),
                    isAlignmentBetween: false),
                AppPaddings.generalPadding),
            divider(false),
            filterchoice(),
            divider(false),
            butterFlyButton(ActivityTextUtil.okey, () {})
          ],
        ),
      ),
    );
  }

  Expanded filterchoice() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Obx(
            () => filtermin(DemoInformation.personList[index], () {
              print(index);
              activityController.iconFilter(index);
            },
                activityController.activityIcon[index]
                    ? IconUtility.circleIcon
                    : IconUtility.checkCircleIcon),
          );
        },
        shrinkWrap: true,
        itemCount: DemoInformation.personList.length,
      ),
    );
  }
}
