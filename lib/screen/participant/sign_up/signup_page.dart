import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../login/login_page.dart';
import '../profile/util/profile_page_utility.dart';
import '../profile/util/textfield_utility.dart';

class ParticipantSignUpPage extends StatefulWidget {
  const ParticipantSignUpPage({super.key});

  @override
  State<ParticipantSignUpPage> createState() => _ParticipantSignUpPageState();
}

class _ParticipantSignUpPageState extends State<ParticipantSignUpPage> {
  late final SignUpController _signUpController;

  @override
  void initState() {
    _signUpController = Get.put(SignUpController());
    super.initState();
  }

  @override
  void dispose() {
    _signUpController.dispose();
    Get.delete<SignUpController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextfieldUtility textfieldUtility = TextfieldUtility();
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title(),
              textfieldUtility.nameSurnameTextfield(
                  _signUpController.nameController, true),
              textfieldUtility.birthOfDateTextfield(
                  _signUpController.birthDateController, true),

              ///TODO: use gender controller
              CustomDropDown(
                purpose: genderList,
                height: 56,
                width: 342,
              ),
              textfieldUtility.mailTextfield(
                  _signUpController.emailController, true),
              textfieldUtility.passwordTextfield(
                  _signUpController.passwordController, true),
              textfieldUtility.phoneTextfield(
                  _signUpController.phoneController, true),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                textColor: Colors.white,
                container:
                    ProfilePageUtility.loginSignUpButtonContainer(false, false),
                onTap: () {
                  _signUpController.signUpWithEmail();
                },
                text: 'Kaydol',
              ),
              ProfilePageUtility.lineWithOrText(),
              CustomButton(
                textColor: AppColors.butterflyBush,
                container:
                    ProfilePageUtility.loginSignUpButtonContainer(false, true),
                onTap: () => Get.to(() => const ParticipantLoginPage()),
                text: 'Giriş Yap',
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding title() {
    return const Padding(
      padding: EdgeInsets.only(top: 60, bottom: 25),
      child: Text('Kaydol', style: AppTextStyles.loginSignUpBigTitle),
    );
  }
}
