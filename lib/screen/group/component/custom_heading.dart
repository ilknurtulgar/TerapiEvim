import 'package:flutter/material.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';

import '../../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class CustomHeading extends StatelessWidget {
  CustomHeading({super.key, required this.text, this.isToggle});
  String text;
  bool? isToggle;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: GroupPaddings.customHeadingPadding,
      child: Text(
        text,
        style: isToggle != null
            ? AppTextStyles.normalTextStyle("medium", false)
            : AppTextStyles.heading(false),
      ),
    );
  }
}
