import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/models/container_model.dart';
import '../../../participant/group/util/lock_screen_utility.dart';

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
                  isAlignmentBetween: false),
              const EdgeInsets.only(bottom: 83, top: 30)),
          Container(
            padding: LockScreenUtil.lockScreenContainerPadding,
            width: LockScreenUtil.lockScreenBigContainerWidth,
            decoration: AppBoxDecoration.lockScreenBox,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 55),
                    child: Text(
                      GroupTextUtil.whyConfirmingText,
                      style: AppTextStyles.aboutMeTextStyle(false),
                    )),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 55),
                  child: Text(
                    GroupTextUtil.pdfUploadingText,
                    style: AppTextStyles.aboutMeTextStyle(false),
                  ),
                ),
                CustomButton(
                    textColor: Colors.white,
                    container: ContainerModel(
                        width: 123,
                        height: 30,
                        borderRadius: 100,
                        backgroundColor: AppColors.butterflyBush),
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
              textColor: Colors.white,
              container: ContainerModel(
                backgroundColor: AppColors.melrose,
                borderRadius: 100,
                width: 100,
                height: 40,
              ),
              onTap: () {},
              text: GroupTextUtil.confirmText)
        ],
      )),
    );
  }
}
