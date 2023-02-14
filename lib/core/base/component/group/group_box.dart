import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';

class ActivityBox extends StatelessWidget {
  const ActivityBox(
      {super.key,
      required this.containerModel,
      required this.arowModel,
      required this.ayrowwModel,
      required this.isactivity,
      required this.clockModel});
  final ContainerModel containerModel;
  final RowModel arowModel;
  final RowModel ayrowwModel;
  final RowModel clockModel;
  final bool isactivity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: isactivity ? 140 : 165,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          //
          rowView(arowModel,
              const EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
          rowView(ayrowwModel,
              const EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
          rowView(clockModel,
              const EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  container: containerModel,
                  onTap: () {},
                  text: "Katıl",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

RowModel arowmodel = RowModel(
    isAlignmentBetween: true,
    text: "Grup Terapilerinin Etkisi",
    textStyle: const TextStyle(),
    leadingIcon: IconUtility.activityIcon);

RowModel ayrowmodel = RowModel(
    isAlignmentBetween: true,
    text: "Özlem Ulusan",
    textStyle: const TextStyle(),
    leadingIcon: IconUtility.personIcon);
RowModel clockmodel = RowModel(
    isAlignmentBetween: true,
    text: "Ocak 15,2023,20:00",
    textStyle: const TextStyle(),
    leadingIcon: IconUtility.clockIcon);
