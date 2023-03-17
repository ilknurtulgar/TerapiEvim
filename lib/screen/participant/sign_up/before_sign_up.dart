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
            const SizedBox(height: SizeUtil.mediumValueHeight,), // bu sized box'ı ev resmine top 100 padding vermemek için kullandım
            homeImage(),
            Text(LoginSignUpTextUtil.appName,style: AppTextStyles.heading(true),),
            smallSizedBox(),
            Text(LoginSignUpTextUtil.welcome,style: AppTextStyles.normalTextStyle('medium', false),),
            smallSizedBox(),
            questionText(),
            smallSizedBox(),
            button(true,context),
            button(false,context),
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

  Text questionText() {
    return Text(
      LoginSignUpTextUtil.whoAreYou,
      style: AppTextStyles.normalTextStyle('medium', false),
      textAlign: TextAlign.center,
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
      padding: AppPaddings.smallVerticalPadding,
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
