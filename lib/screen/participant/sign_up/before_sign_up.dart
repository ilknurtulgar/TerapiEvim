import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_profile_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/sign_up/signup_page.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/util/base_utility.dart';

class BeforeSignUp extends StatelessWidget {
  BeforeSignUp({super.key});
  final TherapistProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    button(true,context),
                    button(false,context),
                  ],
                ),
              ),
            )
          ],
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
      padding: textNo==1 ? EdgeInsets.zero : textNo==2 ? AppPaddings.customContainerInsidePadding(2) :  AppPaddings.componentOnlyPadding(2),
      child: Text(
        textNo==1 ? LoginSignUpTextUtil.appName : textNo==2 ?  LoginSignUpTextUtil.welcome : LoginSignUpTextUtil.whoAreYou,
        style: textNo==1 ? AppTextStyles.heading(true) : AppTextStyles.normalTextStyle('medium', false),
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

  Padding button(bool isForParticipant, BuildContext context) {
    return Padding(
      padding: AppPaddings.customContainerInsidePadding(2),
      child: CustomButton(
        container: AppContainers.beforeLoginButtonContainer,
        onTap: () {
          controller.isForParticipant.value = isForParticipant;
          context.push(const SignUpPage());
        },
        text: isForParticipant
            ? LoginSignUpTextUtil.participant
            : LoginSignUpTextUtil.therapist,
        textColor: AppColors.white,
      ),
    );
  }
}
