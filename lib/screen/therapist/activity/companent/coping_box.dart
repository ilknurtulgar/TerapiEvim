import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

class CopingBox extends StatelessWidget {
  const CopingBox({super.key, required this.copingtext, required this.pdfname});
  final String copingtext;
  final String pdfname;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.notificationDec,
      width: 342,
      child: Column(
        children: [heading(), pdfcontainer(), rowbutton()],
      ),
    );
  }

  Row rowbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        copingbutton(() => null, ActivityTextUtil.add, true),
        copingbutton(() => null, ActivityTextUtil.share, false)
      ],
    );
  }

  Padding copingbutton(Function() onTap, String copingtext, bool isAdd) {
    return Padding(
      padding: AppPaddings.copingButtonPadding,
      child: CustomButton(
          icon: isAdd ? IconUtility.fileIcon : null,
          container: AppContainers.copingbutton,
          textColor: AppColors.black,
          onTap: onTap,
          text: copingtext),
    );
  }

  CustomHeading heading() {
    return CustomHeading(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
        bottom: 25,
      ),
      text: copingtext,
      isalignmentstart: true,
      isToggle: true,
    );
  }

  Container pdfcontainer() {
    return Container(
      decoration: AppBoxDecoration.lockScreenBox,
      width: 248,
      height: 47,
      child: Padding(
        padding: PaddingAdd.toppadding,
        child: Text(pdfname,
            textAlign: TextAlign.center,
            style: AppTextStyles.normalTextStyle("medium", false)),
      ),
    );
  }
}

class PaddingAdd {
  static const EdgeInsets toppadding = EdgeInsets.only(
    top: 10,
  );
  static const EdgeInsets startpadding = EdgeInsets.only(left: 35, top: 35);
  static const EdgeInsets centerpadding = EdgeInsets.only(left: 150, top: 35);
}
