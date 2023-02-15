import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../models/container_model.dart';

class ChoosingTimeGroupTherapy extends StatelessWidget {
  ChoosingTimeGroupTherapy({super.key});
  final ContainerModel container = ContainerModel(borderRadius: 8, backgroundColor: AppColors.white, height: 33, width: 71);
  final TherapistGroupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        timeContainer(true), // saat 
        colon(false),
        timeContainer(false) // dakika
      ],
    );
  }

  InkWell timeContainer(bool isHour) {
    return InkWell(
      onTap: () => controller.showChoosingTimeDialog(),
      child: Container(
        height: container.height,
        width: container.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(container.borderRadius),
            color: container.backgroundColor),
        child: Center(
            child: Obx(() => Text(isHour
                ? controller.chosenHour.value
                : controller.chosenMinutes.value))),
      ),
    );
  }
}
