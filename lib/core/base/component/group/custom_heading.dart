import 'package:flutter/material.dart';

import '../../../../../core/base/util/base_utility.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading(
      {super.key,
      required this.text,
      required this.isalignmentstart,
      this.isToggle = false,
      this.padding});

  final String text;
  final bool isToggle;
  final bool isalignmentstart;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: isalignmentstart
            ? AlignmentDirectional.centerStart
            : Alignment.center,
        padding: padding ?? AppPaddings.appBarPadding,
        child: responsivenestext(
          text,
          isToggle
              ? AppTextStyles.normalTextStyle("medium", false)
              : AppTextStyles.heading(false),
        ));
  }
}
