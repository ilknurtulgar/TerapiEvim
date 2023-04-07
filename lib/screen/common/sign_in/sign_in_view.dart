import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/common/sign_in/util/sign_in_view_utility.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../product/widget/common/profile/utility/textfield_utility.dart';
import '../sign_up/before_sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final LoginController _loginController;

  final TextFieldUtility textfieldUtility = TextFieldUtility();

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
            width: context.width1,
            height: context.height1,
            child: Padding(
              padding: AppPaddings.pagePaddingHorizontal,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SignInViewUtility.title(true),
                    mailTextfield(),
                    passwordColumn(),
                    SignInViewUtility.button(
                      true,
                      true,
                      () {
                        _loginController.loginWithEmail();
                      },
                    ),
                    SignInViewUtility.lineWithOrText(context),
                    SignInViewUtility.button(
                      false,
                      true,
                      () => context.push(BeforeSignUpView()),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Padding mailTextfield() {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: textfieldUtility.mailTextfield(
          _loginController.emailController, true),
    );
  }

  Widget passwordColumn() {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          textfieldUtility.passwordTextfield(
              _loginController.passwordController, true),
          forgotYourPasswordTextButton(),
        ],
      ),
    );
  }

  Widget forgotYourPasswordTextButton() {
    return TextButton(
        onPressed: () {
          /* Şifreyi unutma durumundaki fonksiyon gelecek*/
        },
        child: Text(
          LoginSignUpTextUtil.forgotYourPassword,
          style: const TextStyle(
              color: AppColors.meteorite,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ));
  }
}
