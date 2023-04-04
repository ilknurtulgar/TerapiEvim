import 'package:flutter/material.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/group/custom_heading.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';

class CopingBox extends StatelessWidget {
  const CopingBox({super.key, required this.copingtext, required this.pdfname});
  final String copingtext;
  final String pdfname;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.componentPadding,
      decoration: AppBoxDecoration.shadow,
      //width: SizeUtil.generalWidth,
      height: SizeUtil.highValueHeight,
      child: Column(
        children: [heading(), pdfcontainer(), rowbutton()],
      ),
    );
  }

  Row rowbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        copingbutton(() => null, ActivityTextUtil.add, true),
        copingbutton(() => null, ActivityTextUtil.share, false)
      ],
    );
  }

  Widget copingbutton(Function() onTap, String copingtext, bool isAdd) {
    return CustomButton(
        icon: isAdd ? IconUtility.fileIcon : null,
        container: AppContainers.copingbutton,
        textColor: AppColors.black,
        onTap: onTap,
        text: copingtext);
  }

  CustomHeading heading() {
    return CustomHeading(
      padding: AppPaddings.rowViewPadding,
      text: copingtext,
      isalignmentstart: true,
      isToggle: true,
    );
  }

  Widget pdfcontainer() {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: Container(
        margin: AppPaddings.componentPadding,
        decoration: AppBoxDecoration.purpleBorder,
        //  width: SizeUtil.largeValueWidth,
        height: SizeUtil.generalHeight,
        child: Align(
          alignment: Alignment.center,
          child: Text(pdfname,
              style: AppTextStyles.normalTextStyle("medium", false)),
        ),
      ),
    );
  }
}
