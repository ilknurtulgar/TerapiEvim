import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class MyGroups extends StatelessWidget {
  MyGroups({super.key}); //gecici modeller
  RowModel row_1 = RowModel(
      leadingIcon: IconUtility.activityIcon,
      text: "Yeme Bozukluğu Grubu 1",
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: false);
  RowModel row_2 = RowModel(
      leadingIcon: IconUtility.personIcon,
      text: "Yardımcı Psikolog  : Bekleniyor.. ",
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: false);
  RowModel row_3 = RowModel(
      leadingIcon: IconUtility.greyGroupsIcon,
      text: "Katılımcı Sayısı : 0/20",
      textStyle: AppTextStyles.normalTextStyle('small', false),
      isAlignmentBetween: false);

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
                EdgeInsets.only(top: 18, left: 30, right: 30, bottom: 40)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                  child: SeminarMax(
                      onTap: () {},
                      row1: row_1,
                      row2: row_2,
                      row3: row_3,
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
