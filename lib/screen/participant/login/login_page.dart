import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';
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
                      LoginPageUtility.loginSignUpButtonContainer(true, true),
                  onTap: () {
                    _loginController.loginWithEmail();
                  },
                  text: LoginSignUpTextUtil.login,
                ),
                LoginPageUtility.lineWithOrText(),
                CustomButton(
                  textColor: AppColors.butterflyBush,
                  container: LoginPageUtility.loginSignUpButtonContainer(
                      true, false),
                  onTap: () => Get.to(() => const SignUpPage()),
                  text: LoginSignUpTextUtil.signUp,
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
            child: Text(
             LoginSignUpTextUtil.forgotYourPassword,
              style: const TextStyle(color: AppColors.meteorite),
            )));
  }

  Padding loginPageTitle() {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 35),
      child: Text(
        LoginSignUpTextUtil.login,
        style: AppTextStyles.loginSignUpBigTitle,
      ),
    );
  }
}
