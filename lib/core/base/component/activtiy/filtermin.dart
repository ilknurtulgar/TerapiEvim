import 'package:flutter/material.dart';

import '../../../../screen/participant/activity/activities.dart';
import '../../util/base_utility.dart';

Widget filtermin(String heading, Function()? onTap, Icon icon) {
  return Padding(
    padding: AppPaddings.componentPadding,
    child: Container(
      height: SizeUtil.normalValueHeight,
      decoration: AppBoxDecoration.sendDecoration,
      child: headingminto(
          heading, onTap, MainAxisAlignment.spaceBetween, false, icon),
    ),
  );
}
