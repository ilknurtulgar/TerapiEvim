import 'package:flutter/cupertino.dart';
import 'package:terapievim/components/buttons/filter_box.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/container_model.dart';
import 'package:terapievim/models/row_model.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.containerModel,
      required this.isActivity,
      required this.customText});
  final ContainerModel containerModel;
  bool isActivity;

  String customText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: containerModel.width,
          height: containerModel.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(containerModel.borderRadius),
              color: containerModel.backgroundColor,
              boxShadow: [
                BoxShadow(
                    color:
                        isActivity ? AppColors.doveGray : AppColors.coldPurple,
                    spreadRadius: 3)
              ]),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(customText),
              ),
              // rowModel.trailingIcon!=null? rowModel.trailingIcon! : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

ContainerModel customTextModel = ContainerModel(
    width: 342, borderRadius: 8, backgroundColor: AppColors.white);
