import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';
import 'package:terapievim/screen/therapist/home/home.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox(
      {super.key,
      required this.istwobutton,
      this.ayrowwModel,
      required this.buttonText,
      required this.containerModel,
      required this.arowModel,
      this.onTap,
      required this.isactivity,
      required this.clockModel});
  final ContainerModel containerModel;
  final RowModel arowModel;
  final RowModel? ayrowwModel;
  final RowModel clockModel;
  final bool isactivity;
  final bool istwobutton;
  final Function()? onTap;
  final String buttonText;
  final TherapistActivtyController therapistActivtyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isactivity ? null : onTap,
      child: Container(
        width: Responsive.width(350, context),
        // height: 140,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
          borderRadius: AppBorderRadius.generalBorderRadius,
        ),
        child: Column(
          children: [
            rowView(arowModel, AppPaddings.activityBoxPadding),
            isactivity
                ? const SizedBox.shrink()
                : rowView(ayrowwModel!, AppPaddings.activityBoxPadding),
            rowView(clockModel, AppPaddings.activityBoxPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                istwobutton
                    ? Padding(
                        padding: AppPaddings.generalPadding,
                        child: rowbutton(() {
                          therapistActivtyController.updatechnage(0);
                          Get.to(const NewActivityScreen());
                        }, ActivityTextUtil.updateMyInformation, true),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: AppPaddings.generalPadding,
                  child: rowbutton(() {}, buttonText, false),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rowbutton(Function() onTap, String buttonText, bool bigWidth) {
    return CustomButton(
      textColor: AppColors.white,
      container: AppContainers.containerButton(bigWidth),
      onTap: onTap,
      text: buttonText,
    );
  }
}
