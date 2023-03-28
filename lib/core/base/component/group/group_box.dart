import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox({
    super.key,
    required this.istwobutton,
    this.ayrowwModel,
    required this.buttonText,
    required this.containerModel,
    required this.arowModel,
    required this.isactivity,
    required this.clockModel,
    this.onButtonTap,
    this.onTap,
  });

  final ContainerModel containerModel;
  final RowModel arowModel;
  final RowModel? ayrowwModel;
  final RowModel clockModel;
  final bool isactivity;
  final bool istwobutton;
  final Function()? onButtonTap, onTap;
  final String buttonText;

  /// TODO: therapistActivityController should not be  initialized here
  /// TODO: because it also used by participant
  final TherapistActivtyController therapistActivtyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isactivity ? null : onTap,
      child: Padding(
        padding: AppPaddings.componentPadding,
        child: Container(
          height: SizeUtil.doubleNormalValueHeight,
          decoration: AppBoxDecoration.purpleBorder,
          child: Column(
            children: [
              Expanded(child: rowView(arowModel, AppPaddings.rowViewPadding)),
              isactivity
                  ? const SizedBox.shrink()
                  : rowView(ayrowwModel!, AppPaddings.rowViewPadding),
              rowView(clockModel, AppPaddings.rowViewPadding),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    istwobutton
                        ? rowbutton(() {
                            therapistActivtyController.updatechnage(0);

                            context.push(NewActivityScreen(
                                activity: therapistActivtyController
                                    .recentActivities[0]));
                          }, ActivityTextUtil.updateMyInformation,
                            AppContainers.hugeContainerButton())
                        : const SizedBox.shrink(),
                    rowbutton(() {
                      onButtonTap != null ? onButtonTap!() : null;
                    }, buttonText, AppContainers.containerButton(false)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rowbutton(
      Function() onTap, String buttonText, ContainerModel containerbutton) {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: CustomButton(
        textColor: AppColors.white,
        container: containerbutton,
        onTap: onTap,
        text: buttonText,
      ),
    );
  }
}
