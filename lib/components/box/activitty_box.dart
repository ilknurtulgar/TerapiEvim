import 'package:flutter/material.dart';
import 'package:terapievim/components/buttons/custom_icon_button.dart';
import 'package:terapievim/components/text/custom_textfield.dart';
import 'package:terapievim/models/model_view/row_view.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox({super.key, required this.customButton});
  CustomButton customButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            RowView(leadingModel),
            RowView(leadingModel),
            RowView(leadingModel),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
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

CustomButton customButton = CustomButton(
    onTap: () {},
    buttonWidth: 100,
    buttonHeight: 25,
    buttonColor: Colors.deepPurple,
    buttonText: "katil");
