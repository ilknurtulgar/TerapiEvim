import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/participant/activity/filter_details.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              filterappbar(),
              filtermin(ActivityTextUtil.psychologist, () {
                context.push(FilterDetails());
              }, IconUtility.forward),
              filtermin(ActivityTextUtil.date, () {}, IconUtility.forward),
              filtermin(ActivityTextUtil.issue, () {}, IconUtility.forward),
            ],
          ),
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
  return Padding(
    padding: AppPaddings.componentPadding,
    child: Container(
      // width: SizeUtil.generalWidth,
      height: 56,

      decoration: AppBoxDecoration.sendDecoration,
      child: activityminto(
          heading, onTap, MainAxisAlignment.spaceBetween, false, icon),
    ),
  );
}
