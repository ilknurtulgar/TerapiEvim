import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/custom_list_wheel_scroll_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

class ScrollableTime extends StatelessWidget {
  const ScrollableTime(
      {super.key,
      required this.chooseHourFunction,
      required this.chooseMinuteFunction,
      required this.hourInitialValue,
      required this.minuteInitialValue});
  final Function(int)? chooseHourFunction;
  final Function(int)? chooseMinuteFunction;
  final int hourInitialValue;
  final int minuteInitialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomListWheelScrollView(
                whatIsFor: ScrollPurpose.hour,
                onSelectedItemChanged: chooseHourFunction,
                initialValue: hourInitialValue,
              ),
              colon(true),
              CustomListWheelScrollView(
                whatIsFor: ScrollPurpose.minute,
                onSelectedItemChanged: chooseMinuteFunction,
                initialValue: minuteInitialValue,
              ),
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
            child: Text(
              ActivityTextUtil.okey,
              style: TextStyle(color: AppColors.butterflyBush),
            )),
      ),
    );
  }
}
