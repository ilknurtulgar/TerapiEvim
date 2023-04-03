import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

///TODO: CustomTextField should be independent from activityController

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.isBig,
    this.rowModel,
    required this.textController,
    required this.isRowModel,
    required this.isOne,
    this.title,
    this.obsecureText,
    this.prefixText,
    this.maxLines,
  }) : super(key: key);

  final RowModel? rowModel;
  final int? maxLines;
  final bool isBig;
  final bool isRowModel;
  final String? prefixText;
  final String? title;

  final bool isOne;
  final bool? obsecureText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    /*  if (isBig == true && rowModel == null) {
      throw Exception(
          "cant help is big true and row model is null in customtextfield");
    }*/
    print("maxlines");
    return isOne ? textField(context) : columnTextField(context);
  }

  Column columnTextField(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsivenestext(
            title ?? "", AppTextStyles.normalTextStyle("medium", false)),
        SizedBox(width: 200, child: textField(context)),
      ],
    );
  }

  Widget textField(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: TextField(
        maxLines: maxLines ?? 2,
        controller: textController,
        obscureText: obsecureText ?? false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              isBig ? const EdgeInsets.all(12) : AppPaddings.contentPadding,
          filled: true,
          fillColor: AppColors.white,
          suffix:
              isBig ? (rowModel == null ? null : rowModel!.trailingIcon) : null,
          prefixIcon: isRowModel ? rowModel?.leadingIcon : null,
          hintText: rowModel?.text2,
          hintStyle: rowModel?.textStyle2 ??
              AppTextStyles.normalTextStyle("small", false),
          prefixText: prefixText,
          enabledBorder: bordercolor(isBig),
          focusedBorder: bordercolor(isBig),
        ),
      ),
    );
  }
}

OutlineInputBorder bordercolor(bool isBig) {
  return OutlineInputBorder(
      borderRadius: AppBorderRadius.generalBorderRadius,
      borderSide: BorderSide(
        color: isBig
            ? BorderColorUtil.textfieldBorderColor
            : BorderColorUtil.generalBorderColor,
        width: 1,
      ));
}
