import 'package:flutter/cupertino.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/container_model.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key, required this.containerModel, required this.customText});
  final ContainerModel containerModel;
  String customText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerModel.width,
      height: containerModel.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerModel.borderRadius),
          color: containerModel.backgroundColor,
          boxShadow: [BoxShadow(color: AppColors.coldPurple, spreadRadius: 4)]),
      child: Text(customText),
    );
  }
}

ContainerModel container_Model = ContainerModel(
    width: 342, height: 208, borderRadius: 8, backgroundColor: AppColors.white);

ContainerModel container_model = ContainerModel(
    width: 342, height: 114, borderRadius: 8, backgroundColor: AppColors.white);
