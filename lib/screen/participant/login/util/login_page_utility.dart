import 'package:flutter/material.dart';
import 'package:terapievim/screen/participant/login/before_login.dart';
import '../../../../core/base/models/container_model.dart';
import '../../../../core/base/util/base_utility.dart';
class LoginPageUtility{
  static ContainerModel beforeLoginButtonContainer() => ContainerModel(
        height: 50,
        width: 300,
        borderRadius: 65,
        backgroundColor: AppColors.butterflyBush,
      );

  static ContainerModel loginSignUpButtonContainer(
          bool isInLoginPage, bool isLoginButton) =>
      ContainerModel(
          width: 342,
          borderRadius: 8,
          backgroundColor: (isInLoginPage && isLoginButton) ||
                  (isInLoginPage == false && isLoginButton == false)
              ? AppColors.royalBlue
              : AppColors.white,
          height: 43);
    
   static Padding lineWithOrText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          horizontalLine(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Ya da'),
          ),
          horizontalLine()
        ],
      ),
    );
  }

  static Container horizontalLine() {
    return Container(
      color: AppColors.black,
      height: 1,
      width: 150,
    );
  }

}