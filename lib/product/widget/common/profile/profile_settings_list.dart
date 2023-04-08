import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../../controller/profile_settings_controller.dart';
import '../../../../core/base/component/profile/column_drop_down.dart';
import 'utility/textfield_utility.dart';

class ProfileSettingsList extends StatelessWidget {
  ProfileSettingsList({Key? key, required this.profileController}) : super(key: key);
  final IProfileController profileController;

  @override
  Widget build(BuildContext context) {
    TextFieldUtility textFieldUtility = TextFieldUtility();

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        textFieldUtility.nameSurnameTextfield(
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
    return Padding(
        padding: AppPaddings.componentPadding,
        child: ColumnDropDown(
          isInProfilePage: true,
          title: "Cinsiyet",
          onValueSelected: (int index) {},
          onDropDownTapped: () {},
          selectedText: '',
          textList: [],
        ),
      );
  }
}