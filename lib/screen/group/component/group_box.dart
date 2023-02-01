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
      required this.clockModel});
  Custombutton customButton;
  RowModel arowModel;
  RowModel ayrowwModel;
  RowModel clockModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: 350,
        height: 165,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [

            rowView(arowModel,EdgeInsets.symmetric(horizontal: 30)),
            rowView(ayrowwModel,EdgeInsets.symmetric(horizontal: 30)),
            rowView(clockModel,EdgeInsets.symmetric(horizontal: 30)),

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
    buttonWidth: 123,
    buttonHeight: 30,
    buttonColor: Colors.deepPurple,
    buttonText: "katil");

RowModel arow_model = RowModel(
    text: "anapsikolog",
    textStyle: TextStyle(),
    leadingIcon: IconUtility.personIcon);

RowModel ayrow_model = RowModel(
    text: "yardımcıpsikolog",
    textStyle: TextStyle(),
    leadingIcon: IconUtility.personIcon);
RowModel clock_model = RowModel(
    text: "saat", textStyle: TextStyle(), leadingIcon: IconUtility.clockIcon);
