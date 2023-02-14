import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/util/base_utility.dart';
import 'util/profile_page_utility.dart';
import 'util/textfield_utility.dart';

// ignore: must_be_immutable
class ParticipantProfileSettingPage extends StatelessWidget {
  ParticipantProfileSettingPage({super.key});
  String imagePath = 'assets/images/f1.jpg';
  TextEditingController nameSurnameControllerInSetting =
      TextEditingController(text: "Kerem Engin");
  TextEditingController mailControllerInSetting =
      TextEditingController(text: "test@gmail.com");
  TextEditingController passwordControllerInSetting =
      TextEditingController(text: "asdf");
  TextEditingController phoneControllerInSetting =
      TextEditingController(text: "5055139645");
  TextfieldUtility textfieldUtility = TextfieldUtility();
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ProfilePageUtility.backgroundOfThePage(true),
        ProfilePageUtility.profilePagePersonImage(imagePath),
        ProfilePageUtility.positionedIconButton(Icons.arrow_back_ios_outlined,
            () {
          /* profil sayfasına geri dönüş fonksiyonunu şimdilik koymadım çünkü required modeller var burada yer kaplayacaktı */
        }, 15, 330),
        ProfilePageUtility.positionedIconButton(Icons.edit_outlined, () {
          /* foto düzenleme */
        }, 235, 75),
        positionedTextfield(
            0,
            textfieldUtility.nameSurnameTextfield(
                nameSurnameControllerInSetting, false)),
        positionedTextfield(
            1,
            textfieldUtility.birthOfDateTextfield(
                profileController.birthOfDateController.value, false)),
        positionedTextfield(
          2,
          const CustomDropDown(purpose: 'gender'),
        ),
        positionedTextfield(
            3, textfieldUtility.mailTextfield(mailControllerInSetting, false)),
        positionedTextfield(
            4,
            textfieldUtility.passwordTextfield(
                passwordControllerInSetting, false)),
        positionedTextfield(5,
            textfieldUtility.phoneTextfield(phoneControllerInSetting, false)),
        saveButton()
      ]),
    );
  }

  Positioned saveButton() {
    return Positioned(
        top: 620,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (window.physicalSize.width - 150) / 2),
            child: CustomButton(
                container: AppContainers.purpleButtonContainer(150),
                onTap: () {/* kaydet fonksiyonu*/},
                text: 'Kaydet')));
  }

  Positioned positionedTextfield(double rowIndex, Widget textField) {
    return Positioned(
      top: 300 + (50 * rowIndex),
      left: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Center(
          child: SizedBox(
            width: 345,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ProfilePageUtility.informationTitle[rowIndex.toInt()]),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: textField,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
