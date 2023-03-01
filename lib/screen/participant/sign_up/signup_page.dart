import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';
import '../../../controller/auth/sign_up_controller.dart';
import '../login/login_page.dart';
import '../profile/util/profile_page_utility.dart';
import '../profile/util/textfield_utility.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key,});
  
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

  TextfieldUtility textfieldUtility = TextfieldUtility();

  late List<Widget> textfieldList = [
    textfieldUtility.nameSurnameTextfield(_signUpController.nameController, true),
    textfieldUtility.birthOfDateTextfield(_signUpController.birthDateController, true),
    genderDropDown(),
    textfieldUtility.mailTextfield(_signUpController.emailController, true),
    textfieldUtility.passwordTextfield(_signUpController.passwordController, true),
    textfieldUtility.phoneTextfield(_signUpController.phoneController, true),
  ];

  ///TODO: use gender controller
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginPageUtility.title(false),
              ...textfieldList,
              widget.isForParticipant == false
                  ? acceptMakingShortCallContainer(controller)
                  : const SizedBox(),
              LoginPageUtility.button(false,false,() {_signUpController.signUpWithEmail();},),
              LoginPageUtility.lineWithOrText(),
              LoginPageUtility.button(true,false, () => Get.to(() => const ParticipantLoginPage())),
              const SizedBox(height: 25,)
            ],
          ),
        ),
      ),
    );
  }

  CustomDropDown genderDropDown() {
    return CustomDropDown(
      purpose: genderList,
      height: 56,
      width: 342,
    );
  }

  Padding acceptMakingShortCallContainer(TherapistProfileController controller) {
    ProfilePageUtility profilePageUtility = ProfilePageUtility();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 56,
        width: 342,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.generalBorderRadius,
        ),
        child: profilePageUtility.acceptionRow(true),
      ),
    );
  }
}

/*  textfieldUtility.nameSurnameTextfield(_signUpController.nameController, true),
    textfieldUtility.birthOfDateTextfield( _signUpController.birthDateController, true),
    ///TODO: use gender controller
    genderDropDown(),
    textfieldUtility.mailTextfield(_signUpController.emailController, true),
    textfieldUtility.passwordTextfield(_signUpController.passwordController, true),
    textfieldUtility.phoneTextfield(_signUpController.phoneController, true),
*/
