import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';

class LoginPageUtility {
  static Widget lineWithOrText(BuildContext context) {
    return SizedBox(
      width: Responsive.width(SizeUtil.generalWidth, context),
      child: Row(
        children: [
          myDivider(true,context),
          Text(LoginSignUpTextUtil.orText),
          myDivider(false,context),
        ],
      ),
    );
  }

  static Widget myDivider(bool isAtLeft,BuildContext context) => Expanded(
    child: Divider(
      color: AppColors.black,
      endIndent: isAtLeft ? Responsive.width(10, context): 0,
      indent: isAtLeft ? 0 : Responsive.width(10, context),
      thickness: 1,
    ),
  );

  static CustomButton button(
      bool isForLogin, bool isInLoginPage, Function() onTap,BuildContext context) {
    return CustomButton(
      textColor: isInLoginPage
          ? isForLogin
              ? AppColors.white
              : AppColors.butterflyBush
          : isForLogin
              ? AppColors.butterflyBush
              : AppColors.white,
      container: AppContainers.loginSignUpButtonContainer(isInLoginPage, isForLogin,context),
      onTap: onTap,
      text: isForLogin ? LoginSignUpTextUtil.login : LoginSignUpTextUtil.signUp,
    );
  }

  static Padding title(bool isForLoginPage) => Padding(
        padding: AppPaddings.loginTitlePadding,
        child: Text(
            isForLoginPage
                ? LoginSignUpTextUtil.login
                : LoginSignUpTextUtil.signUp,
            style: AppTextStyles.loginSignUpBigTitle),
      );
}
