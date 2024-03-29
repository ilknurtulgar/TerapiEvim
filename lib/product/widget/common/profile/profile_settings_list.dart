import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../../controller/profile_settings_controller.dart';
import '../../../../core/base/component/profile/column_drop_down.dart';
import 'utility/textfield_utility.dart';

class ProfileSettingsList extends StatelessWidget {
  ProfileSettingsList({
    Key? key,
    required this.profileController,
  }) : super(key: key);
  final IProfileSettingsController profileController;
  @override
  Widget build(BuildContext context) {
    TextFieldUtility textFieldUtility = TextFieldUtility();

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        textFieldUtility.nameSurnameTextField(
            profileController.nameController, false),
        textFieldUtility.birthOfDateTextfield(
            profileController.birthdayController, false),
        //  ProfilePageUtility.genderDropDown(true, profileController.genderController),
        genderChoosing(),
        textFieldUtility.mailTextfield(
            profileController.emailController, false),
        textFieldUtility.passwordTextfield(
            profileController.passwordController, false),
        textFieldUtility.phoneTextfield(
            profileController.phoneNumberController, false),
      ],
    );
  }

  Padding genderChoosing() {
    var gender = profileController.genderController.text.obs;
    return Padding(
      padding: AppPaddings.componentPadding,
      child: ColumnDropDown(
        isBoxSelected: profileController.isBoxSelected,
        isLogin: false,
        isInProfilePage: true,
        title: "Cinsiyet",
        onValueSelected: (int index) {
          profileController.genderController.text = gender.value;
          print(profileController.genderController.text);
        },
        onDropDownTapped: () {
          profileController.setIsBoxSelected();
        },
        selectedText: gender,
      ),
    );
  }
}
