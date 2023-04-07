import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ChoosingTimeGroupTherapy extends StatelessWidget {
  const ChoosingTimeGroupTherapy({
    super.key,
    required this.onTap,
    required this.hour,
    required this.minutes,
  });
  final Function() onTap;
  final String hour;
  final String minutes;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            timeContainer(hour),
            colon(false),
            timeContainer(minutes)],
        ),
      ],
    );
  }

  Widget timeContainer(String time) {
    return CustomButton(
        container: AppContainers.smallTimeContainer,
        textColor: AppColors.black,
        onTap: onTap,
        text: time);
  }
}
