import 'package:flutter/material.dart';

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
        padding: padding ?? AppPaddings.appBarPadding,
        child: responsivenestext(
          text,
          isToggle!
              ? AppTextStyles.normalTextStyle("medium", false)
              : AppTextStyles.heading(false),
        ));
  }
}
