import 'package:flutter/material.dart';

import '../../util/base_utility.dart';

class HeadingMinto extends StatelessWidget {
  const HeadingMinto(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.mainAxisAlignment,
      required this.isButterfly,
      required this.icon});
  final String text;
  final Function() onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final bool isButterfly;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          text,
          style: isButterfly
              ? AppTextStyles.activityTextStyles()
              : AppTextStyles.normalTextStyle("medium", false),
        ),
        IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
