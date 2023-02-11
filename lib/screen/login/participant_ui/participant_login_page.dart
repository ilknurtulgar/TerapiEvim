import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import 'package:terapievim/screen/profile/utility/profile_page_utility.dart';
import 'package:terapievim/screen/profile/utility/textfield_utility.dart';
import '../../sign_up/participant_ui/participant_signup_page.dart';

class ParticipantLoginPage extends StatelessWidget {
  ParticipantLoginPage({super.key});
  final TextEditingController mailControllerLoginPage = TextEditingController();
  final TextEditingController passwordControllerLoginPage =
      TextEditingController();
  final TextfieldUtility textfieldUtility = TextfieldUtility();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            loginPageTitle(),
            textfieldUtility.mailTextfield(mailControllerLoginPage, true),
            textfieldUtility.passwordTextfield(
                passwordControllerLoginPage, true),
            forgotYourPasswordTextButton(),
            CustomButton(
              container:
                  ProfilePageUtility.loginSignUpButtonContainer(true, true),
              onTap: () {/* giriş yapma fonksiyonu*/},
              text: 'Giriş Yap',
            ),
            ProfilePageUtility.lineWithOrText(),
            CustomButton(
              container:
                  ProfilePageUtility.loginSignUpButtonContainer(true, false),
              onTap: () => Get.to(() => const ParticipantSignUpPage()),
              text: 'Kaydol',
            ),
            const SizedBox(
              height: 58,
            ),
          ]),
    );
  }

  Padding forgotYourPasswordTextButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(227, 0, 24, 40),
        child: TextButton(
            onPressed: () {/* Şifreyi unutma durumundaki fonksiyon gelecek*/},
            child: const Text(
              'Şifreni mi unuttun?',
              style: TextStyle(color: AppColors.meteorite),
            )));
  }

  Padding loginPageTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 140, 0, 85),
      child: Text(
        'Giriş Yap',
        style: AppTextStyles.loginSignUpBigTitle,
      ),
    );
  }
}
