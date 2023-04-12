import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/activity/p_activity_controller.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../core/base/component/activtiy/filtermin.dart';
import '../../../core/base/util/base_model.dart';

class FilterDetailsView extends StatelessWidget {
  FilterDetailsView({super.key});
  final PActivityController activityController = Get.put(PActivityController());

  ///TODO: participantactivty  baseview bağla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                RowView(
                    rowModel: UiBaseModel.filterdetails(context),
                    padding: AppPaddings.generalPadding),
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
