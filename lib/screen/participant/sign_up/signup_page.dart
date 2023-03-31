import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../../controller/main_controller.dart';
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
  MainController mainController = Get.find();

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

  late final String _userRole = mainController.isTherapist.value ? "therapist" : "participant";

  ///TODO: use gender controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 32,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                LoginPageUtility.title(false),
                ...textfieldList,
                Obx(
                  () => mainController.isTherapist.value
                      ? acceptMakingShortCallContainer()
                      : const SizedBox(),
                ),
                LoginPageUtility.button(false, false, () {
                  _signUpController.signUpWithEmail(context,_userRole);
                }, context),
                LoginPageUtility.lineWithOrText(context),
                LoginPageUtility.button(true, false,
                    () => context.push(const ParticipantLoginPage()), context),
                const SizedBox()
              ],
            ),
          ),
        ));
  }

  Container acceptMakingShortCallContainer() {
    return Container(
      decoration: AppBoxDecoration.noBorder,
      child: SizedBox(
          width: Responsive.width(SizeUtil.generalWidth, context),
          child: Padding(
            padding: MediaQuery.of(context).size.width < 574
                ? AppPaddings.componentPadding
                : EdgeInsets.zero,
            child: AcceptionRow(isForMakingShortCall: true),
          )),
    );
  }
}
