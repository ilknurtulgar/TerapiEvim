import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/common/sign_in/sign_in_view.dart';
import 'package:terapievim/screen/common/sign_in/util/sign_in_view_utility.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../../controller/main_controller.dart';
import '../../../controller/therapist/profil/t_profile_controller.dart';
import '../../../core/base/component/profile/acception_row.dart';
import '../../participant/profile/util/p_textfield_utility.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
  });

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final SignUpController _signUpController;
  final TProfileController profileController = Get.find();
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

  PTextfieldUtility textfieldUtility = PTextfieldUtility();

  late List<Widget> textfieldList = [
    textfieldUtility.nameSurnameTextfield(
        _signUpController.nameController, true),
    textfieldUtility.birthOfDateTextfield(
        _signUpController.birthDateController, true),

    ///TODO: commented temporarily
    // ProfilePageUtility.genderDropDown(
    //     false, _signUpController.genderController),
    textfieldUtility.mailTextfield(_signUpController.emailController, true),
    textfieldUtility.passwordTextfield(
        _signUpController.passwordController, true),
    textfieldUtility.phoneTextfield(_signUpController.phoneController, true),
  ];

  late final String _userRole =
      mainController.isTherapist.value ? "therapist" : "participant";

  ///TODO: use gender controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: AppPaddings.pagePaddingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SignInViewUtility.title(false),
                  textfieldListView(),
                  mediumSizedBox(),
                  Obx(
                    () => mainController.isTherapist.value
                        ? acceptMakingShortCallContainer()
                        : const SizedBox(),
                  ),
                  SignInViewUtility.button(
                    false,
                    false,
                    () {
                      _signUpController.signUpWithEmail(context, _userRole);
                    },
                  ),
                  SignInViewUtility.lineWithOrText(context),
                  SignInViewUtility.button(
                    true,
                    false,
                    () => context.push(const SignInView()),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  ListView textfieldListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: textfieldList.length,
      itemBuilder: ((context, index) => Padding(
            padding: AppPaddings.componentPadding,
            child: textfieldList[index],
          )),
    );
  }

  Widget acceptMakingShortCallContainer() {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(2),
      child: Container(
        decoration: AppBoxDecoration.noBorder,
        child: SizedBox(
            width: context.width1,
            child: Padding(
              padding: context.width1 < 574
                  ? AppPaddings.generalPadding
                  : EdgeInsets.zero,
              child: Obx(
                () => AcceptionRow(
                  isForMakingShortCall: true,
                  acceptionFunction: () => profileController.acceptionFunction(true),
                  value: profileController.isMakingShortCallAccepted.value,
                  ),
              ),
            )),
      ),
    );
  }
}
