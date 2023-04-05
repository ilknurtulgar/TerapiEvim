import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/common/sign_up/sign_up_view.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/util/base_utility.dart';

class BeforeSignUpView extends StatelessWidget {
  BeforeSignUpView({super.key});
  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: Center(
          child: Column(
            children: [
              getBackIconbutton(),
              Expanded(
                child: Padding(
                  padding: AppPaddings.pagePadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      homeImage(),
                      text(1),
                      text(2),
                      text(3),
                      button(false, context),
                      button(true, context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Align getBackIconbutton() {
    return Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              IconUtility.back.icon,
              size: 50,
            )));
  }

  Widget text(int textNo) {
    return Padding(
      padding: textNo == 1
          ? EdgeInsets.zero
          : textNo == 2
              ? AppPaddings.customContainerInsidePadding(2)
              : AppPaddings.componentOnlyPadding(2),
      child: Text(
        textNo == 1
            ? LoginSignUpTextUtil.appName
            : textNo == 2
                ? LoginSignUpTextUtil.welcome
                : LoginSignUpTextUtil.whoAreYou,
        style: textNo == 1
            ? AppTextStyles.heading(true)
            : AppTextStyles.normalTextStyle('medium', false),
        textAlign: TextAlign.center,
      ),
    );
  }

  SizedBox homeImage() {
    return SizedBox(
        height: SizeUtil.largeValueHeight,
        width: SizeUtil.largeValueHeight,
        child: Image(image: AssetImage(LoginSignUpTextUtil.homeImagePath)));
  }

  Padding button(bool isTherapist, BuildContext context) {
    return Padding(
      padding: AppPaddings.customContainerInsidePadding(2),
      child: CustomButton(
        container: AppContainers.beforeLoginButtonContainer,
        onTap: () {
          controller.isTherapist.value = isTherapist;
          context.push(const SignUpView());
        },
        text: isTherapist
            ? LoginSignUpTextUtil.therapist
            : LoginSignUpTextUtil.participant,
        textColor: AppColors.white,
      ),
    );
  }
}
