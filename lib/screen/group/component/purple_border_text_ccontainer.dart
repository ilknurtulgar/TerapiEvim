import 'package:flutter/material.dart';
import 'package:terapievim/screen/group/util/lockScreenutility.dart';

import '../../../core/base/util/base_utility.dart';

class PurpleBorderWhiteInsideTextContainer extends StatelessWidget {
  const PurpleBorderWhiteInsideTextContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: LockScreenUtil.lockScreenContainerPadding,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.aboutMeTextStyle(false),
      ),
      width: LockScreenUtil.lockScreenBigContainerWidth,
      decoration: AppBoxDecoration.lockScreenBox,
    );
  }
}
