import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/common/sign_in/util/sign_in_view_utility.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/base/component/login/custom_textfield.dart';
import '../../../core/base/ui_models/row_model.dart';
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
                    textfieldUtility.mailTextfield(
                        _loginController.emailController, true),
                    passwordColumn(),
                    smallSizedBox(),
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

  Widget passwordColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        textfieldUtility.passwordTextfield(
            _loginController.passwordController, true),
        forgotYourPasswordTextButton(),
        /*CustomTextField(
            isOne: false,
            title: "Şifre",
            textController: _loginController.passwordController,
            rowModel: RowModel(
              text: "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.lockSmall,
              trailingIcon: IconButton(
                  icon: Icon(
                    IconUtility.visibilityoffIcon.icon,
                    color: AppColors.black,
                  ),
                  onPressed: () {}),
            ),
            isBig: true,
            isRowModel: true),
        CustomTextField(
            isOne: false,
            title: "E Posta",
            textController: _loginController.passwordController,
            rowModel: RowModel(
                text2: "abcde@gmail.com",
                text: "",
                textStyle: const TextStyle(color: AppColors.black),
                isAlignmentBetween: false,
                leadingIcon: IconUtility.emailIcon),
            isBig: true,
            obsecureText: false,
            isRowModel: true),*/
      ],
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
