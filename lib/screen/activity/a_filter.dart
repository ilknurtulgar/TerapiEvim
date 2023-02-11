import 'package:flutter/material.dart';
import 'package:terapievim/screen/activity/component/filter_box.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';

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
