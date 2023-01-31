import 'package:flutter/material.dart';

import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/container_model.dart';

class QuestionsBox extends StatelessWidget {
  const QuestionsBox({super.key, required this.containerModel});
  final ContainerModel containerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerModel.width,
      height: containerModel.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerModel.borderRadius),
          color: containerModel.backgroundColor,
          boxShadow: [BoxShadow(color: AppColors.coldPurple, spreadRadius: 4)]),
      child: Column(
        children: [
          Text("data"),
          IconUtility.activityIcon /*togge button olacak burada daha koyamadım*/
        ],
      ),
    );
  }
}
