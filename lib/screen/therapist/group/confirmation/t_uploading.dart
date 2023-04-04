import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist_group_controller.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/group/custom_heading.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../screen/therapist/group/confirmation/t_lock_screen_therapist.dart';

class TherapistUploadConfirm extends StatelessWidget {
  const TherapistUploadConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    TherapistGroupController controller = Get.find();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomHeading(
              text: GroupTextUtil.confirmingText,
              isalignmentstart: false,
              padding: AppPaddings.appBarPadding,
            ),
            Container(
              padding: AppPaddings.appBarPadding,
              width: SizeUtil.generalWidth,
              decoration: AppBoxDecoration.purpleBorder,
              // height: SizeUtil.bigValueHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    GroupTextUtil.whyConfirmingText,
                    style: AppTextStyles.aboutMeTextStyle(false),
                  ),
                  const SizedBox(
                    height: SizeUtil.normalValueHeight,
                  ),
                  Text(
                    GroupTextUtil.pdfUploadingText,
                    style: AppTextStyles.aboutMeTextStyle(false),
                  ),
                  sizedbox(),
                  CustomButton(
                      textColor: AppColors.white,
                      container: AppContainers.purpleButtonContainer(
                          SizeUtil.smallValueWidth),
                      onTap: () {
                        //yukleyeccek
                      },
                      text: GroupTextUtil.uploadText),
                  // smallSizedBox()
                ],
              ),
            ),
            // const SizedBox(
            //   height: SizeUtil.normalValueHeight,
            // ),
            CustomButton(
                textColor: AppColors.white,
                container: AppContainers.purpleButtonContainer(
                    SizeUtil.smallValueWidth),
                onTap: () {
                  controller.changeIsTherapistLoaded();
                  controller.changeisLockedOpen();
                  context
                      .pop(); //iki kere yapmam gerekiyor cunku lock screeenin tekrar build edilmesi gerekiyor
                  context.pop();
                  context.push(const LockScreenTherapist());
                },
                text: GroupTextUtil.confirmText)
          ],
        ),
      )),
    );
  }
}
