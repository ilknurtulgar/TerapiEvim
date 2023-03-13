import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/models/container_model.dart';
import '../../../../core/base/util/base_utility.dart';

class LoginPageUtility {
  static ContainerModel beforeLoginButtonContainer() => ContainerModel(
        height: SizeUtil.beforeLoginButtonHeight,
        width: SizeUtil.hugeValueWidth,
        borderRadius: 65,
        backgroundColor: AppColors.butterflyBush,
      );

  static ContainerModel loginSignUpButtonContainer(
          bool isInLoginPage, bool isLoginButton) =>
      ContainerModel(
          width: SizeUtil.generalWidth,
          borderRadius: 8,
          backgroundColor: (isInLoginPage && isLoginButton) ||
                  (isInLoginPage == false && isLoginButton == false)
              ? AppColors.royalBlue
              : AppColors.white,
          height: SizeUtil.loginSignUpButtonHeight);

  static Padding lineWithOrText() {
    return Padding(
      padding: AppPaddings.smallVerticalPadding,
      child: SizedBox(
        width: SizeUtil.generalWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            horizontalLine(),
            Text(LoginSignUpTextUtil.orText),
            horizontalLine()
          ],
        ),
      ),
    );
  }

  static Container horizontalLine() {
    return Container(
      color: AppColors.black,
      height: SizeUtil.horizontalLineHeight,
      width: SizeUtil.normalValueWidth,
    );
  }

  static CustomButton button(
      bool isForLogin, bool isInLoginPage, Function() onTap) {
    return CustomButton(
      textColor: isInLoginPage
          ? isForLogin
              ? AppColors.white
              : AppColors.butterflyBush
          : isForLogin
              ? AppColors.butterflyBush
              : AppColors.white,
      container: LoginPageUtility.loginSignUpButtonContainer(
          isInLoginPage, isForLogin),
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
