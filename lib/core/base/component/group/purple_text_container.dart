
import 'package:flutter/material.dart';
import 'package:terapievim/screen/participant/group/util/lock_screen_utility.dart';

import '../../util/base_utility.dart';

class PurpleTextContainer extends StatelessWidget {
  const PurpleTextContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: LockScreenUtil.lockScreenContainerPadding,
      width: LockScreenUtil.lockScreenBigContainerWidth,
      decoration: AppBoxDecoration.lockScreenBox,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.aboutMeTextStyle(false),
      ),
    );
  }
}
