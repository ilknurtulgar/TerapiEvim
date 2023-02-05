import 'package:flutter/material.dart';

import '../../../core/base/util/base_utility.dart';

class Heading extends StatelessWidget {
  Heading({super.key, required this.headingText, this.padding});
  String headingText;
  EdgeInsets? padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: padding == null ? EdgeInsets.symmetric(vertical: 25) : padding!,
      child: Text(
        headingText,
        style: AppTextStyles.heading(false),
      ),
    );
  }
}
