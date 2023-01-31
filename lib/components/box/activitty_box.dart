import 'package:flutter/material.dart';
import 'package:terapievim/components/buttons/button.dart';
import 'package:terapievim/components/text/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/model_view/row_view.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox({super.key, required this.customButton});
  Custombutton customButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            rowView(leadingModel),
            rowView(leadingModel),
            rowView(leadingModel),
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
    buttonWidth: 100,
    buttonHeight: 25,
    buttonColor: Colors.deepPurple,
    buttonText: "katil");
