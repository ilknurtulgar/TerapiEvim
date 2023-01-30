import 'dart:html';

import 'package:flutter/material.dart';
import 'package:terapievim/components/buttons/custom_icon_button.dart';
import 'package:terapievim/models/card_model.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox({super.key, required this.customButton});
  CustomButton customButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /* row_view(rowModel),
          row_view(rowModel),
          row_view(rowModel),*/
          CustomButton(
              onTap: () {},
              buttonWidth: customButton.buttonWidth,
              buttonHeight: customButton.buttonHeight,
              buttonColor: customButton.buttonColor,
              buttonText: customButton.buttonText)
        ],
      ),
    );
  }
}
