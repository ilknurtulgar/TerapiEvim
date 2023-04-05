import 'package:flutter/material.dart';

import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/group/custom_heading.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';

class CopingBox extends StatelessWidget {
  const CopingBox({
    super.key,
    required this.copingText,
    required this.pdfName,
    required this.onAddTapped,
    required this.onShareTapped,
  });

  final String copingText;
  final String pdfName;
  final Function() onAddTapped, onShareTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.componentPadding,
      decoration: AppBoxDecoration.shadow,
      //width: SizeUtil.generalWidth,
      height: SizeUtil.highValueHeight,
      child: Column(
        children: [
          heading(),
          pdfContainer(),
          rowButton(
            onAddTapped: onAddTapped,
            onShareTapped: onShareTapped,
          )
        ],
      ),
    );
  }

  Row rowButton(
      {required Function() onAddTapped, required Function() onShareTapped}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        copingButton(onAddTapped, ActivityTextUtil.add, true),
        copingButton(onShareTapped, ActivityTextUtil.share, false)
      ],
    );
  }

  Widget copingButton(Function() onTap, String copingText, bool isAdd) {
    return CustomButton(
        icon: isAdd ? IconUtility.fileIcon : null,
        container: AppContainers.copingbutton,
        textColor: AppColors.black,
        onTap: onTap,
        text: copingText);
  }

  CustomHeading heading() {
    return CustomHeading(
      padding: AppPaddings.rowViewPadding,
      text: copingText,
      isalignmentstart: true,
      isToggle: true,
    );
  }

  Widget pdfContainer() {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: Container(
        margin: AppPaddings.componentPadding,
        decoration: AppBoxDecoration.purpleBorder,
        //  width: SizeUtil.largeValueWidth,
        height: SizeUtil.generalHeight,
        child: Align(
          alignment: Alignment.center,
          child: Text(pdfName,
              style: AppTextStyles.normalTextStyle("medium", false)),
        ),
      ),
    );
  }
}
