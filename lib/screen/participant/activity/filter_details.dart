import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../core/base/component/activtiy/filtermin.dart';
import '../../../core/base/util/base_model.dart';

class FilterDetails extends StatelessWidget {
  FilterDetails({super.key});
  final ActivityController activityController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                rowView(UiBaseModel.filterdetails(context),
                    AppPaddings.generalPadding),
                //divider(false),
                filterchoice(),
                //  butterFlyButton(ActivityTextUtil.okey, () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filterchoice() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Obx(
          () => filtermin(DemoInformation.personList[index], () {
            activityController.iconFilter(index);
          },
              activityController.activityIcon[index]
                  ? IconUtility.circleIcon
                  : IconUtility.checkCircleIcon),
        );
      },
      shrinkWrap: true,
      itemCount: DemoInformation.personList.length,
    );
  }
}
