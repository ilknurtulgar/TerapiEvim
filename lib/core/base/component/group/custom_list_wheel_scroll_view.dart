import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_profile_controller.dart';
import '../../../../controller/therapist_group_controller.dart';
import '../../util/base_utility.dart';

class CustomListWheelScrollView extends StatelessWidget {
  CustomListWheelScrollView({super.key, required this.whatIsFor});
  final String whatIsFor;
  final TherapistGroupController groupController = Get.find();
  final TherapistProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle:  whatIsFor == 'number of groups' ? -pi/2 : 0,
      child: SizedBox(
        width: SizeUtil.lowValueWidth,
        height: whatIsFor == 'number of groups' ? SizeUtil.mediumValueHeight : SizeUtil.largeValueHeight,
        child: ListWheelScrollView.useDelegate(
          onSelectedItemChanged: (value) => groupController.scrollableWidgetFunction(whatIsFor, value),
          overAndUnderCenterOpacity: 0.75,
          itemExtent: 40,
          perspective: 0.002,
          diameterRatio: 0.9,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: whatIsFor == 'hour'
                  ? 24
                  : whatIsFor == 'minutes'
                      ? 60
                      : 21, // grup sayısına maksimum 20 sınırı koydum (0 dan 20'ye kadar)
              builder: (context, index) {
                return whatIsFor == 'number of groups'
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
                      style:AppTextStyles.profileTextStyles(true, false),
                    );
  }

  Center animatedText(int index) {
    return Center(
                      child: Obx(
                        () => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          color: AppColors.transparent,
                          height: profileController.isNumberVisible.value ? SizeUtil.lowValueHeight : SizeUtil.zeroSize,
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
