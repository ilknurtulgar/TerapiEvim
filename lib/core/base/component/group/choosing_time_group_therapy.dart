import 'package:flutter/material.dart';
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
            timeContainer(minutes)
          ],
        ),
      ],
    );
  }

  InkWell timeContainer(String time) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppContainers.smallTimeContainer.height,
        width: AppContainers.smallTimeContainer.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppContainers.smallTimeContainer.borderRadius),
            color: AppContainers.smallTimeContainer.backgroundColor),
        child: Center(
          child: Text(time,style: AppTextStyles.normalTextStyle('medium', false),
          ),
        ),
      ),
    );
  }
}
