import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import '../../../core/base/util/base_utility.dart';

class EmptySizedBoxText extends StatelessWidget {
  const EmptySizedBoxText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Column(
        children: [
          SizedBox(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                EmptyTextUtil.emptyText,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
