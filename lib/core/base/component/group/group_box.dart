import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';

class ActivityBox extends StatelessWidget {
  const ActivityBox(
      {super.key,
      this.ayrowwModel,
      required this.buttonText,
      required this.containerModel,
      required this.arowModel,
      required this.isactivity,
      required this.clockModel});
  final ContainerModel containerModel;
  final RowModel arowModel;
  final RowModel? ayrowwModel;
  final RowModel clockModel;
  final bool isactivity;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      // height: 140,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          rowView(arowModel,
              const EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
          isactivity
              ? const SizedBox.shrink()
              : rowView(ayrowwModel!,
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
          rowView(clockModel,
              const EdgeInsets.symmetric(horizontal: 15, vertical: 3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isactivity
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: rowbutton(() {}, "Bilgilerimi Güncelle", true),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: rowbutton(() {}, buttonText, false),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget rowbutton(Function() onTap, String buttonText, bool bigWidth) {
    return CustomButton(
      textColor: Colors.white,
      container: DemoInformation.containerButton(bigWidth),
      onTap: onTap,
      text: buttonText,
    );
  }
}
