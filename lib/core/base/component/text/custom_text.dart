import 'package:flutter/cupertino.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/container_model.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.containerModel,
      required this.isActivity,
      required this.customText});
  final ContainerModel containerModel;
  final bool isActivity;

  final String customText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerModel.width,
      height: containerModel.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerModel.borderRadius),
          color: containerModel.backgroundColor,
          boxShadow: [
            BoxShadow(
                color: isActivity ? AppColors.doveGray : AppColors.coldPurple,
                spreadRadius: 3)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(customText),
      ),
    );
  }
}

ContainerModel customTextModel = ContainerModel(
    width: 342, borderRadius: 8, backgroundColor: AppColors.white);
