import 'package:flutter/material.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

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
    this.onTap,
    required this.isPassword,
    this.keyboardType,
  }) : super(key: key);

  final RowModel? rowModel;
  final int? maxLines;
  final bool isBig;
  final bool isRowModel;
  final String? prefixText;
  final String? title;
  final Function()? onTap;
  final bool isPassword;
  final bool isOne;
  final bool? obsecureText;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return isOne
        ? textField(context, isPassword, keyboardType)
        : columnTextField(context);
  }

  Padding columnTextField(
    BuildContext context,
  ) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          responsivenestext(
              title ?? "", AppTextStyles.normalTextStyle("medium", false)),
          textField(context, isPassword, keyboardType),
        ],
      ),
    );
  }

  Widget textField(
      BuildContext context, bool isPasword, TextInputType? keyboardType) {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(1),
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        controller: textController,
        obscureText: obsecureText ?? false,

        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        readOnly: onTap != null ? true : false,
        onTap: onTap,
        decoration: InputDecoration(
          constraints: isPassword
              ? BoxConstraints.loose(Size.fromHeight(50))
              : BoxConstraints(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          filled: true,
          fillColor: AppColors.white,
          suffix:
              isBig ? (rowModel == null ? null : rowModel!.trailingIcon) : null,
          prefixIcon: isRowModel ? rowModel?.leadingIcon : null,
          hintText: rowModel?.text,
          hintStyle: rowModel?.textStyle ??
              AppTextStyles.normalTextStyle("small", false),
          prefixText: prefixText,
          enabledBorder: AppBoxDecoration.borderColor(isBig),
          focusedBorder: AppBoxDecoration.borderColor(isBig),
        ),
      ),
    );
  }
}
