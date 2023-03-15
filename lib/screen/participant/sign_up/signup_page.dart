import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/base/component/profile/acception_row.dart';
import '../login/login_page.dart';
import '../profile/util/profile_page_utility.dart';
import '../profile/util/textfield_utility.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });
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
    textfieldUtility.nameSurnameTextfield(
        _signUpController.nameController, true),
    textfieldUtility.birthOfDateTextfield(
        _signUpController.birthDateController, true),
    ProfilePageUtility.genderDropDown(
        false, _signUpController.genderController),
    textfieldUtility.mailTextfield(_signUpController.emailController, true),
    textfieldUtility.passwordTextfield(
        _signUpController.passwordController, true),
    textfieldUtility.phoneTextfield(_signUpController.phoneController, true),
  ];

  ///TODO: use gender controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            spacing: 24,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              LoginPageUtility.title(false),
              ...textfieldList,
              Obx(
                () => controller.isForParticipant.value == false
                    ? acceptMakingShortCallContainer()
                    : const SizedBox(),
              ),
              LoginPageUtility.button(
                false,
                false,
                () {
                  _signUpController.signUpWithEmail(context);
                },
              ),
              LoginPageUtility.lineWithOrText(),
              LoginPageUtility.button(true, false,
                  () => context.push(const ParticipantLoginPage())),
              mediumSizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Container acceptMakingShortCallContainer() {
    return Container(
      height: SizeUtil.generalHeight,
      width: SizeUtil.generalWidth,
      decoration: AppBoxDecoration.noBorder,
      child: AcceptionRow(isForMakingShortCall: true),
    );
  }

/*  textfieldUtility.nameSurnameTextfield(_signUpController.nameController, true),
    textfieldUtility.birthOfDateTextfield( _signUpController.birthDateController, true),
    ///TODO: use gender controller
    genderDropDown(),
    textfieldUtility.mailTextfield(_signUpController.emailController, true),
    textfieldUtility.passwordTextfield(_signUpController.passwordController, true),
    textfieldUtility.phoneTextfield(_signUpController.phoneController, true),
*/
}
