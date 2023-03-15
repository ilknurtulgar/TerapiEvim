import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../core/base/component/buttons/custom_button.dart';

class TherapistUploadConfirm extends StatelessWidget {
  const TherapistUploadConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    String heading = GroupTextUtil.confirmingText;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          rowView(
              RowModel(
                  text: heading,
                  textStyle: AppTextStyles.heading(false),
                  isAlignmentBetween: true),
              AppPaddings.tLockScreenAppBarPadding),
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
                  height: 70,
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
                    container: AppContainers.purpleButtonContainer(123),
                    onTap: () {
                      //yukleyeccek
                    },
                    text: GroupTextUtil.uploadText),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
              textColor: AppColors.white,
              container: AppContainers.purpleButtonContainer(123),
              onTap: () {},
              text: GroupTextUtil.confirmText)
        ],
      )),
    );
  }
}
