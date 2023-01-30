import 'package:flutter/material.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

class ToggleQuestions extends StatelessWidget {
  ToggleQuestions({super.key});
  final selected = true;
  List<Widget> choice = <Widget>[
    Icon(Icons.circle_outlined),
    Icon(Icons.circle_outlined),
    Icon(Icons.circle_outlined),
    Icon(Icons.circle_outlined),
    Icon(Icons.circle_outlined),
  ];
  final List<bool> _selectedchoice = <bool>[true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        direction: Axis.horizontal,
        onPressed: ((index) {}),
        renderBorder: true,
        borderRadius: BorderRadius.circular(3),
        borderColor: Colors.transparent,
        selectedBorderColor: Colors.transparent,
        fillColor: Colors.transparent,
        selectedColor: AppColors.black,
        constraints: BoxConstraints(minHeight: 3, minWidth: 3),
        children: choice,
        borderWidth: 10,
        isSelected: _selectedchoice);
  }
}
