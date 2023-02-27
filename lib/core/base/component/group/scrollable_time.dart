import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ScrollableTime extends StatelessWidget {
  ScrollableTime({super.key});
  final TherapistGroupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              listWheelScrollView(24, true), // saat
              colon(true),
              listWheelScrollView(60, false), // dakika
            ]),
        okayTextButton(),
      ],
    );
  }
  
  Padding okayTextButton() {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Align(
          alignment: Alignment.topRight,
          child: TextButton(onPressed: () => Get.back(), child: const Text('Tamam',style: TextStyle(color: AppColors.butterflyBush),)),
        ),
      );
  }

  SizedBox listWheelScrollView(int childCount, bool isHour) {
    return SizedBox(
      width: 70,
      height: 150,
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (value) => controller.scrollableWidgetFunction(isHour ? 'hour' : 'minutes',value),
        overAndUnderCenterOpacity: 0.75,
        itemExtent: 40,
        perspective: 0.002,
        diameterRatio: 0.9,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: childCount,
            builder: (context, index) {
              return Text(
                index < 10 ? '0${index.toString()}' : index.toString(),
                style: const TextStyle(color: AppColors.black, fontSize: 20),
              );
            }),
      ),
    );
  }
}
