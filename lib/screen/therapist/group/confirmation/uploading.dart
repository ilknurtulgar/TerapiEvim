import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../core/base/component/buttons/custom_button.dart';

class TherapistUploadConfirm extends StatelessWidget {
  const TherapistUploadConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          rowView(
              UiBaseModel.uploadingapp, AppPaddings.tLockScreenAppBarPadding),
          Container(
            padding: AppPaddings.lockScreenContainerPadding,
            width: SizeUtil.generalWidth,
            decoration: AppBoxDecoration.purpleBorder,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: AppPaddings.tLockScreenUploadTextPadding,
                    child: Text(
                      GroupTextUtil.whyConfirmingText,
                      style: AppTextStyles.aboutMeTextStyle(false),
                    )),
                const SizedBox(
                  height: SizeUtil.normalValueHeight,
                ),
                Padding(
                  padding: AppPaddings.tLockScreenPdfPadding,
                  child: Text(
                    GroupTextUtil.pdfUploadingText,
                    style: AppTextStyles.aboutMeTextStyle(false),
                  ),
                ),
                CustomButton(
                    textColor: AppColors.white,
                    container: AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
                    onTap: () {
                      //yukleyeccek
                    },
                    text: GroupTextUtil.uploadText),
                smallSizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: SizeUtil.normalValueHeight,
          ),
          CustomButton(
              textColor: AppColors.white,
              container: AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
              onTap: () {},
              text: GroupTextUtil.confirmText)
        ],
      )),
    );
  }
}
