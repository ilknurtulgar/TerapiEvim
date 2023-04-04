import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';

class LoginPageUtility {
  static Widget lineWithOrText(BuildContext context) {
    return Padding(
      padding: AppPaddings.customContainerInsidePadding(2),
      child: SizedBox(
        width: context.width1,
        child: Row(
          children: [
            myDivider(true, context),
            Text(LoginSignUpTextUtil.orText),
            myDivider(false, context),
          ],
        ),
      ),
    );
  }

  static Widget myDivider(bool isAtLeft, BuildContext context) => Expanded(
        child: Divider(
          color: AppColors.black,
          endIndent: isAtLeft ? Responsive.width(10, context) : 0,
          indent: isAtLeft ? 0 : Responsive.width(10, context),
          thickness: 1,
        ),
      );

  static Widget button(bool isForLogin, bool isInLoginPage, Function() onTap) {
    return Padding(
      padding: AppPaddings.customContainerInsidePadding(2),
      child: CustomButton(
        textColor: isInLoginPage
            ? isForLogin
                ? AppColors.white
                : AppColors.butterflyBush
            : isForLogin
                ? AppColors.butterflyBush
                : AppColors.white,
        container:
            AppContainers.loginSignUpButtonContainer(isInLoginPage, isForLogin),
        onTap: onTap,
        text:
            isForLogin ? LoginSignUpTextUtil.login : LoginSignUpTextUtil.signUp,
      ),
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
