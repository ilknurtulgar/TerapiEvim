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
      child: Row(
        children: [
          myDivider(true),
          Text(LoginSignUpTextUtil.orText),
          myDivider(false),
        ],
      ),
    );
  }

  static SizedBox  myDivider(bool isAtLeft) => SizedBox(
    width: SizeUtil.normalValueWidth,
    child: Divider(
          color: AppColors.black,
          endIndent: isAtLeft ? 10 : 0,
          indent: isAtLeft ? 0 : 10,
          thickness: 1,
        ),
  );

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
