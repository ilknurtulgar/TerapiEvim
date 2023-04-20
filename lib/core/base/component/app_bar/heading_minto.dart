import 'package:flutter/material.dart';

import '../../util/base_utility.dart';

class HeadingMinto extends StatelessWidget {
  const HeadingMinto(
      {super.key,
      required this.text,
      this.onPressed,
      required this.mainAxisAlignment,
      required this.isButterfly,
      this.icon,
      required this.isIcon});
  final String text;
  final Function()? onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final bool isButterfly;
  final Icon? icon;
  final bool isIcon;
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
        isIcon
            ? IconButton(
                icon: icon!,
                onPressed: onPressed,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
