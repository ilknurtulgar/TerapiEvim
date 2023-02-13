import 'package:flutter/material.dart';
import 'package:terapievim/screen/participant/group/util/group_screen_utility.dart';

import '../../../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class CustomHeading extends StatelessWidget {
  CustomHeading(
      {super.key,
      required this.text,
      this.isToggle,
      required this.isalignmentstart,
      this.padding});
  String text;
  bool? isToggle;
  bool isalignmentstart;
  EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isalignmentstart
          ? AlignmentDirectional.centerStart
          : Alignment.center,
      padding: padding ??
          GroupPaddings
              .customHeadingPadding, //const EdgeInsets.symmetric(vertical: 25) sikinti cikarsa bu
      child: Text(
        text,
        style: isToggle != null
            ? AppTextStyles.normalTextStyle("medium", false)
            : AppTextStyles.heading(false),
      ),
    );
  }
}
