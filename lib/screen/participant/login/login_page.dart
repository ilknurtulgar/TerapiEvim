import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';
import 'package:terapievim/screen/participant/profile/util/textfield_utility.dart';
import '../../../controller/auth/login_controller.dart';
import '../sign_up/before_sign_up.dart';

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
          child: SizedBox(
            width: SizeUtil.generalWidth,
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 24,
              children: [
              largeSizedBox(),
              LoginPageUtility.title(true),
              textfieldUtility.mailTextfield(_loginController.emailController, true),
              passwordColumn(),
              LoginPageUtility.button(true, true, () {_loginController.loginWithEmail();}),
              LoginPageUtility.lineWithOrText(),
              LoginPageUtility.button(false, true, () => context.push(BeforeSignUp())),
            ]),
          ),
        ),
      ),
    );
  }

  Column passwordColumn() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 textfieldUtility.passwordTextfield(_loginController.passwordController, true),
                 forgotYourPasswordTextButton(),
              ],
            );
  }

  Widget forgotYourPasswordTextButton() {
    return TextButton(
        onPressed: () {/* Şifreyi unutma durumundaki fonksiyon gelecek*/},
        child: Text(
          LoginSignUpTextUtil.forgotYourPassword,
          style: const TextStyle(color: AppColors.meteorite),
        ));
  }
}
