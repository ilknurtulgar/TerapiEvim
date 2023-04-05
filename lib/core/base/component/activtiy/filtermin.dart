import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/app_bar/heading_minto.dart';

import '../../util/base_utility.dart';

Widget filtermin(String heading, Function() onTap, Icon icon) {
  return Padding(
    padding: AppPaddings.componentPadding,
    child: Container(
        height: SizeUtil.normalValueHeight,
        decoration: AppBoxDecoration.sendDecoration,
        child: HeadingMinto(
            text: heading,
            onPressed: onTap,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            isButterfly: false,
            icon: icon)),
  );
}
