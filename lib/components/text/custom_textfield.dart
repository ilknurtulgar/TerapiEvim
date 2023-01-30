import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.labelText, required this.hintText})
      : super(key: key);
  String? labelText;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            enabledBorder: enabledBorder(),
            focusedBorder: enabledBorder(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ));
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: AppColors.dustyGray,
      width: 2,
    ));
  }
}
