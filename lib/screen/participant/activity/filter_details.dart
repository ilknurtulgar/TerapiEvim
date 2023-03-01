import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/a_filter.dart';

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
                    text: "Psikolog",
                    textStyle: AppTextStyles.normalTextStyle("big", false),
                    leadingIcon: IconButton(
                        onPressed: () {}, icon: IconUtility.chevronIcon),
                    isAlignmentBetween: false),
                const EdgeInsets.all(8)),
            divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return filtermin(DemoInformation.personList[index], () {
                    activityController.iconFilter();
                  }, IconUtility.activityIcon);
                  /*  activityController.activityIcon.value
                            ? IconUtility.circleIcon
                            : IconUtility.checkCircleIcon),*/
                },
                shrinkWrap: true,
                itemCount: DemoInformation.personList.length,
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  container: AppContainers.containerButton(true),
                  textColor: AppColors.white,
                  onTap: () {},
                  text: "Katıl"),
            ),
          ],
        ),
      ),
    );
  }
}
