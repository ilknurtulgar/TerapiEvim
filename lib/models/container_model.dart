import 'package:flutter/material.dart';
class ContainerModel {
  double width;
  double height;
  double borderRadius;
  Color backgroundColor;
  Color? shadowColor;
  ContainerModel({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.backgroundColor,
    this.shadowColor,
  });
}
