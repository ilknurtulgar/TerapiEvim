import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';

import '../../../../core/base/util/base_utility.dart';

class CustomHeading extends StatelessWidget {
  CustomHeading({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: GroupPaddings.customHeadingPadding,
      child: Text(
        text,
        style: AppTextStyles.heading(false),
      ),
    );
  }
}
