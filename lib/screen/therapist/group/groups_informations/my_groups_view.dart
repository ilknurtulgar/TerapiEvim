import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

// ignore: must_be_immutable
class MyGroups extends StatelessWidget {
  MyGroups({super.key}); //gecici modeller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            rowView(
                RowModel(
                    text: "Gruplarim",
                    textStyle: AppTextStyles.heading(true),
                    isAlignmentBetween: true,
                    trailingIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 40,
                        color: AppColors.meteorite,
                      ),
                    )),
                const EdgeInsets.only(
                    top: 18, left: 30, right: 30, bottom: 40)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                  child: SeminarMax(
                      onTap: () {},
                      row1: DemoInformation.row_1,
                      row2: DemoInformation.row_2,
                      row3: DemoInformation.row_3,
                      borderColor: AppColors.cornFlowerBlue),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
