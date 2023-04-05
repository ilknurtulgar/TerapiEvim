import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/custom_list_wheel_scroll_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ScrollableTime extends StatelessWidget {
  const ScrollableTime({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomListWheelScrollView(whatIsFor: 'hour'),
              colon(true),
              CustomListWheelScrollView(whatIsFor: 'minutes'),
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
        child: TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Tamam',
              style: TextStyle(color: AppColors.butterflyBush),
            )),
      ),
    );
  }
}
