import 'package:flutter/material.dart';

import '../../util/base_utility.dart';

class PurpleTextContainer extends StatelessWidget {
  const PurpleTextContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.componentPadding,
      width: SizeUtil.generalWidth,
      decoration: AppBoxDecoration.lockScreenBox,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.aboutMeTextStyle(false),
      ),
    );
  }
}
