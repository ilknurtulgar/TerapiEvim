import 'package:flutter/material.dart';
import 'package:terapievim/product/widget/common/textfield/text_field.dart';

import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';

class CopingBox extends StatelessWidget {
  const CopingBox({
    super.key,
    required this.copingText,
    required this.pdfName,
    required this.onAddTapped,
    required this.onShareTapped,
    required this.subjectTitleTextController,
  });

  final String copingText;
  final String pdfName;
  final Function() onAddTapped, onShareTapped;
  final TextEditingController subjectTitleTextController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: responsivenestext(ActivityTextUtil.issue,
              AppTextStyles.normalTextStyle("medium", false))),
      TextsField(
        textEditingController: subjectTitleTextController,
        maxLines: 1,
      ),
      TextsField(
        textEditingController: subjectTitleTextController,
        maxLines: 5,
      ),
      pdfContainer(pdfName),
      rowButton(
        onAddTapped: onAddTapped,
        onShareTapped: onShareTapped,
      ),
    ]);
  }

  Row rowButton(
      {required Function() onAddTapped, required Function() onShareTapped}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        copingButton(
          onAddTapped,
          ActivityTextUtil.add,
        ),
        copingButton(
          onShareTapped,
          ActivityTextUtil.share,
        )
      ],
    );
  }

  Widget copingButton(
    Function() onTap,
    String copingText,
  ) {
    return CustomButton(
        container: AppContainers.copingbutton,
        textColor: AppColors.black,
        onTap: onTap,
        text: copingText);
  }

  Widget pdfContainer(String pdfName) {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: Container(
        margin: AppPaddings.componentPadding,
        decoration: AppBoxDecoration.purpleBorder,
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
