import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/profile/column_drop_down.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/common/sign_in/sign_in_view.dart';
import 'package:terapievim/screen/common/sign_in/util/sign_in_view_utility.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../../controller/main_controller.dart';
import '../../../core/base/component/profile/acception_row.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../product/widget/common/profile/utility/textfield_utility.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
  });

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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

  TextFieldUtility textfieldUtility = TextFieldUtility();

  late List<Widget> textfieldList = [
    textfieldUtility.nameSurnameTextfield(
        _signUpController.nameController, true),
    textfieldUtility.birthOfDateTextfield(
        _signUpController.birthDateController, true),
    ColumnDropDown(
        isBoxSelected: _signUpController.isBoxSelected,
        title: "Cinsiyet:",
        isInProfilePage: false,
        selectedText: _signUpController.genders,
        onDropDownTapped: () {
          _signUpController.setIsBoxSelected();
        },
        onValueSelected: (p0) {
          _signUpController.setTextController();
          print(_signUpController.genderController.text);
        },
        isLogin: true),
    textfieldUtility.mailTextfield(_signUpController.emailController, true),
    textfieldUtility.passwordTextfield(
        _signUpController.passwordController, true),
    textfieldUtility.phoneTextfield(_signUpController.phoneController, true),
  ];

  late final String _userRole =
      mainController.isTherapist.value ? "therapist" : "participant";

  void acceptTermOfUse(SignUpController controller) {
    controller.isTermsOfUseAccepted.value =
        !controller.isTermsOfUseAccepted.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: Padding(
          padding: AppPaddings.pagePaddingHorizontal,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Center(child: SignInViewUtility.title(false))),
              textfieldListView(),
              SliverToBoxAdapter(child: mediumSizedBox()),
              SliverToBoxAdapter(
                  child: acceptMakingShortCallContainer(_signUpController)),
              buttonColumn(context)
            ],
          ),
        ));
  }

  SliverToBoxAdapter buttonColumn(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
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
    );
  }

  Widget textfieldListView() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => textfieldList[index],
            childCount: textfieldList.length));
  }

  Widget acceptMakingShortCallContainer(SignUpController controller) {
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
                  explanation: mainController.isTherapist.value
                      ? LoginSignUpTextUtil.therapistAcceptedMakingShortCall
                      : LoginSignUpTextUtil.participantAcceptionText,
                  acceptionFunction: () => acceptTermOfUse(controller),
                  value: controller.isTermsOfUseAccepted.value,
                ),
              ),
            )),
      ),
    );
  }
}
