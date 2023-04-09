import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/base_utility.dart';

class CustomListWheelScrollView extends StatelessWidget {
  CustomListWheelScrollView({
    super.key,
    required this.whatIsFor,
    required this.onSelectedItemChanged,
    this.isNumberVisible,
  });
  final ScrollPurpose whatIsFor;
  final Function(int)? onSelectedItemChanged;
  final RxBool? isNumberVisible;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: whatIsFor == ScrollPurpose.groupNumber ? -pi / 2 : 0,
      child: SizedBox(
        width: SizeUtil.lowValueWidth,
        height: whatIsFor == ScrollPurpose.groupNumber
            ? SizeUtil.mediumValueHeight
            : SizeUtil.largeValueHeight,
        child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: onSelectedItemChanged,
          overAndUnderCenterOpacity: 0.75,
          itemExtent: 40,
          perspective: 0.002,
          diameterRatio: 0.9,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: whatIsFor == ScrollPurpose.hour
                  ? 24
                  : whatIsFor == ScrollPurpose.minute
                      ? 60
                      : 21, // grup sayısına maksimum 20 sınırı koydum (0 dan 20'ye kadar)
              builder: (context, index) {
                return whatIsFor == ScrollPurpose.groupNumber
                    ? animatedText(index)
                    : hourMinuteNumberText(index);
              }),
        ),
      ),
    );
  }

  Text hourMinuteNumberText(int index) {
    return Text(
      index < 10 ? '0${index.toString()}' : index.toString(),
      style: AppTextStyles.profileTextStyles(true, false),
    );
  }

  Center animatedText(int index) {
    return Center(
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: AppColors.transparent,
          height: isNumberVisible!.value
              ? SizeUtil.lowValueHeight
              : SizeUtil.zeroSize,
          child: Transform.rotate(
            angle: pi / 2,
            child: Text(
              (index).toString(),
              style: AppTextStyles.profileTextStyles(true, false),
            ),
          ),
        ),
      ),
    );
  }
}

enum ScrollPurpose {
  groupNumber,
  hour,
  minute,
}
