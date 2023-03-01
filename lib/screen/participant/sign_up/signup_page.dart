import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';
import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../login/login_page.dart';
import '../profile/util/profile_page_utility.dart';
import '../profile/util/textfield_utility.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });
  final bool isForParticipant = false;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpController _signUpController;
  TherapistProfileController controller = Get.put(TherapistProfileController());

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
              const CustomDropDown(
                purpose: DemoInformation.genderList,
                height: 56,
                width: 342,
              ),
              textfieldUtility.mailTextfield(
                  _signUpController.emailController, true),
              textfieldUtility.passwordTextfield(
                  _signUpController.passwordController, true),
              textfieldUtility.phoneTextfield(
                  _signUpController.phoneController, true),
              widget.isForParticipant == false
                  ? acceptMakingShortCallContainer(controller)
                  : const SizedBox(),
              CustomButton(
                textColor: Colors.white,
                container:
                    LoginPageUtility.loginSignUpButtonContainer(false, false),
                onTap: () {
                  _signUpController.signUpWithEmail();
                },
                text: LoginSignUpTextUtil.signUp,
              ),
              LoginPageUtility.lineWithOrText(),
              CustomButton(
                textColor: AppColors.butterflyBush,
                container:
                    LoginPageUtility.loginSignUpButtonContainer(false, true),
                onTap: () => Get.to(() => const ParticipantLoginPage()),
                text: LoginSignUpTextUtil.login,
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

  Padding acceptMakingShortCallContainer(
      TherapistProfileController controller) {
    ProfilePageUtility profilePageUtility = ProfilePageUtility();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 56,
        width: 342,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: profilePageUtility.acceptionRow(true),
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 25),
      child: Text(LoginSignUpTextUtil.signUp,
          style: AppTextStyles.loginSignUpBigTitle),
    );
  }
}
