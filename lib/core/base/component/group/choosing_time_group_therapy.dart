import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../../controller/therapist/group/t_group_controller.dart';

class ChoosingTimeGroupTherapy extends StatelessWidget {
  ChoosingTimeGroupTherapy({super.key});

  ///TODO:getxcontroller burada olmamalı
  final TGroupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            timeContainer(true), // saat
            colon(false),
            timeContainer(false) // dakika
          ],
        ),
      ],
    );
  }

  InkWell timeContainer(bool isHour) {
    return InkWell(
      onTap: () => controller.showChoosingTimeDialog(),
      child: Container(
        height: AppContainers.smallTimeContainer.height,
        width: AppContainers.smallTimeContainer.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                AppContainers.smallTimeContainer.borderRadius),
            color: AppContainers.smallTimeContainer.backgroundColor),
        child: Center(
            child: Obx(() => Text(
                  isHour
                      ? controller.chosenHour.value
                      : controller.chosenMinutes.value,
                  style: AppTextStyles.normalTextStyle('medium', false),
                ))),
      ),
    );
  }
}
