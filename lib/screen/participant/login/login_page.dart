import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/profile/util/profile_page_utility.dart';
import 'package:terapievim/screen/participant/profile/util/textfield_utility.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../sign_up/signup_page.dart';

class ParticipantLoginPage extends StatefulWidget {
  const ParticipantLoginPage({super.key});

  @override
  State<ParticipantLoginPage> createState() => _ParticipantLoginPageState();
}

class _ParticipantLoginPageState extends State<ParticipantLoginPage> {
  late final LoginController _loginController;

  final TextfieldUtility textfieldUtility = TextfieldUtility();

  @override
  void initState() {
    _loginController = Get.put(LoginController());
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                loginPageTitle(),
                textfieldUtility.mailTextfield(
                    _loginController.emailController, true),
                textfieldUtility.passwordTextfield(
                    _loginController.passwordController, true),
                forgotYourPasswordTextButton(),
                CustomButton(
                  textColor: Colors.white,
                  container:
                      ProfilePageUtility.loginSignUpButtonContainer(true, true),
                  onTap: () {
                    _loginController.loginWithEmail();
                  },
                  text: 'Giriş Yap',
                ),
                ProfilePageUtility.lineWithOrText(),
                CustomButton(
                  textColor: AppColors.butterflyBush,
                  container: ProfilePageUtility.loginSignUpButtonContainer(
                      true, false),
                  onTap: () => Get.to(() => const ParticipantSignUpPage()),
                  text: 'Kaydol',
                ),
              ]),
        ),
      ),
    );
  }

  Padding forgotYourPasswordTextButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(227, 0, 24, 40),
        child: TextButton(
            onPressed: () {
              /* Şifreyi unutma durumundaki fonksiyon gelecek*/
            },
            child: const Text(
              'Şifreni mi unuttun?',
              style: TextStyle(color: AppColors.meteorite),
            )));
  }

  Padding loginPageTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 70, 0, 35),
      child: Text(
        'Giriş Yap',
        style: AppTextStyles.loginSignUpBigTitle,
      ),
    );
  }
}
