import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  Custombutton(
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
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            buttonText,
          )),
        ),
      ),
    );
  }
}
