import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/activity/component/drop_down.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../login/participant_ui/login_page.dart';
import '../../profile/utility/profile_page_utility.dart';
import '../../profile/utility/textfield_utility.dart';

class ParticipantSignUpPage extends StatelessWidget {
  const ParticipantSignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameSurnameController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextfieldUtility textfieldUtility = TextfieldUtility();
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Column(
          children: [
            title(),
            textfieldUtility.nameSurnameTextfield(nameSurnameController, true),
            textfieldUtility.birthOfDateTextfield(
                profileController.birthOfDateController.value, true),
            const CustomDropDown(purpose: 'gender'),
            textfieldUtility.mailTextfield(mailController, true),
            textfieldUtility.passwordTextfield(passwordController, true),
            textfieldUtility.phoneTextfield(phoneController, true),
            CustomButton(
              container:
                  ProfilePageUtility.loginSignUpButtonContainer(false, false),
              onTap: () {/* kaydolma fonksiyonu*/},
              text: 'Kaydol',
            ),
            ProfilePageUtility.lineWithOrText(),
            CustomButton(
              container:
                  ProfilePageUtility.loginSignUpButtonContainer(false, true),
              onTap: () => Get.to(() => const ParticipantLoginPage()),
              text: 'Giriş Yap',
            ),
          ],
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
