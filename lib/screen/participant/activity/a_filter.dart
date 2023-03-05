import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/participant/activity/filter_details.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            filterappbar(),
            filtermin(ActivityTextUtil.psychologist, () {
              //  print("tıklıyorum ya");
              Get.to(FilterDetails());
            }, IconUtility.arrowIcon),
            filtermin(ActivityTextUtil.date, () {}, IconUtility.arrowIcon),
            filtermin(ActivityTextUtil.issue, () {}, IconUtility.arrowIcon),
          ],
        ),
      ),
    );
  }

  Row filterappbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          ActivityTextUtil.filtering,
          textAlign: TextAlign.start,
          style: AppTextStyles.normalTextStyle("big", false),
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  ActivityTextUtil.clean,
                  style: AppTextStyles.normalTextStyle("small", false),
                )),
            IconButton(onPressed: () {}, icon: IconUtility.closeIcon)
          ],
        ),
      ],
    );
  }
}

Widget filtermin(String heading, Function()? onTap, Icon icon) {
  return Container(
    padding: AppPaddings.generalPadding,
    margin: AppPaddings.generalPadding,
    width: 342,
    // height: 56,
    decoration: AppBoxDecoration.sendDecoration,
    child: activityminto(
        heading, onTap, MainAxisAlignment.spaceBetween, false, icon),
  );
}
