import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';

import '../../../core/base/component/activtiy/filter_box.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomHeading(
              text: "Filtreleme",
              isalignmentstart: true,
            ),
            FilterBox(rowModel: rowModel),
            FilterBox(rowModel: rowModel),
            const SizedBox(),
            FilterBox(rowModel: rowModel),
            const SizedBox(),
            FilterBox(rowModel: rowModel),
            const SizedBox(),
            FilterBox(rowModel: rowModel),
          ],
        ),
      ),
    );
  }
}
