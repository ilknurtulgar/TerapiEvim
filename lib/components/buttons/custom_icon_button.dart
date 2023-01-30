import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.onTap,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonColor,
      required this.buttonText})
      : super(key: key);
  Function()? onTap;
  String buttonText;
  Color buttonColor;
  double buttonWidth;
  double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Text(
          buttonText,
        )),
      ),
    );
  }
}
