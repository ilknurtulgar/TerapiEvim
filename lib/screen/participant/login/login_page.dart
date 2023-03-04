import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';
import 'package:terapievim/screen/participant/profile/util/textfield_utility.dart';
import '../../../controller/auth/login_controller.dart';
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
        child: Center(
          child: Column(children: [
            sizedbox(),
            LoginPageUtility.title(true),
            textfieldUtility.mailTextfield(
                _loginController.emailController, true),
            textfieldUtility.passwordTextfield(
                _loginController.passwordController, true),
            forgotYourPasswordTextButton(),
            LoginPageUtility.button(true, true, () {
              _loginController.loginWithEmail();
            }),
            LoginPageUtility.lineWithOrText(),
            LoginPageUtility.button(
                false, true, () => Get.to(() => const SignUpPage())),
          ]),
        ),
      ),
    );
  }

  Padding forgotYourPasswordTextButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 18, bottom: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {/* Şifreyi unutma durumundaki fonksiyon gelecek*/},
            child: Text(
              LoginSignUpTextUtil.forgotYourPassword,
              style: const TextStyle(color: AppColors.meteorite),
            )),
      ),
    );
  }
}
