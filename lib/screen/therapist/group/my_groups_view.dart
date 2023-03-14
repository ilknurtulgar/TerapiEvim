import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/group_information.dart';

class MyGroups extends StatelessWidget {
  MyGroups({super.key}); //gecici modeller
  final RowModel row_1 = RowModel(
      leadingIcon: IconUtility.activityIcon,
      text: "Yeme Bozukluğu Grubu 1",
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: false);
  final RowModel row_2 = RowModel(
      leadingIcon: IconUtility.personIcon,
      text: "Yardımcı Psikolog  : Bekleniyor.. ",
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: false);
  final RowModel row_3 = RowModel(
      leadingIcon: IconUtility.groupsIcon,
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
                        onPressed: () {}, icon: IconUtility.addIcon)),
                AppPaddings.appBarPadding),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SeminarMax(
                    onTap: () {
                      context.push(GroupInformation());
                    },
                    row1: row_1,
                    row2: row_2,
                    row3: row_3,
                    borderColor: AppColors.cornFlowerBlue);
              },
            )
          ],
        ),
      ),
    );
  }
}
