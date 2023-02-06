import 'package:flutter/material.dart';
import 'package:terapievim/components/buttons/button.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/row_model.dart';
import 'package:terapievim/models/row_view.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox(
      {super.key,
      required this.customButton,
      required this.arowModel,
      required this.ayrowwModel,
      required this.isactivity,
      required this.clockModel});
  Custombutton customButton;
  RowModel arowModel;
  RowModel ayrowwModel;
  RowModel clockModel;
  bool isactivity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
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
            rowView(
                arowModel, EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
            rowView(
                ayrowwModel, EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
            rowView(
                clockModel, EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Custombutton(
                    onTap: () {},
                    buttonWidth: customButton.buttonWidth,
                    buttonHeight: customButton.buttonHeight,
                    buttonColor: customButton.buttonColor,
                    buttonText: customButton.buttonText),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Custombutton customButton = Custombutton(
    onTap: () {},
    buttonWidth: 97,
    buttonHeight: 30,
    buttonColor: Colors.deepPurple,
    buttonText: "katil");

Custombutton againButton = Custombutton(
    onTap: () {},
    buttonWidth: 97,
    buttonHeight: 30,
    buttonColor: Colors.deepPurple,
    buttonText: "izle");
RowModel arow_model = RowModel(
    isAlignmentBetween: true,
    text: "Grup Terapilerinin Etkisi",
    textStyle: TextStyle(),
    leadingIcon: IconUtility.activityIcon);

RowModel ayrow_model = RowModel(
    isAlignmentBetween: true,
    text: "Özlem Ulusan",
    textStyle: TextStyle(),
    leadingIcon: IconUtility.personIcon);
RowModel clock_model = RowModel(
    isAlignmentBetween: true,
    text: "Ocak 15,2023,20:00",
    textStyle: TextStyle(),
    leadingIcon: IconUtility.clockIcon);
