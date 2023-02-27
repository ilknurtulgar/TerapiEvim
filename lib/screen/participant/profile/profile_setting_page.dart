import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import '../../../controller/therapist_profile_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/util/base_utility.dart';
import 'profile_page.dart';
import 'util/profile_page_utility.dart';
import 'util/textfield_utility.dart';

// ignore: must_be_immutable
class ParticipantProfileSettingPage extends StatelessWidget {
  ParticipantProfileSettingPage({
    super.key,
  });

  bool isForParticipant = false;
  String imagePath = 'assets/images/f1.jpg';

  TextEditingController nameSurnameControllerInSetting = TextEditingController(text: "Kerem Engin");
  TextEditingController mailControllerInSetting = TextEditingController(text: "test@gmail.com");
  TextEditingController passwordControllerInSetting = TextEditingController(text: "asdf");
  TextEditingController phoneControllerInSetting = TextEditingController(text: "5055139645");
  TextEditingController aboutMeController = TextEditingController(text:'''Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım.''');

  TextfieldUtility textfieldUtility = TextfieldUtility();

  ProfileController profileController = Get.find();
  TherapistProfileController therapistProfileController = Get.find();
  TherapistGroupController therapistGroupController = Get.find();

  late List<Widget> textfieldList = [
    textfieldUtility.nameSurnameTextfield(nameSurnameControllerInSetting, false),
    textfieldUtility.birthOfDateTextfield(profileController.birthOfDateController.value, false),
    genderDrowDown(),
    textfieldUtility.mailTextfield(mailControllerInSetting, false),
    textfieldUtility.passwordTextfield(passwordControllerInSetting, false),
    textfieldUtility.phoneTextfield(phoneControllerInSetting, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Stack(children: [
          ProfilePageUtility.backgroundOfThePage(),
          ProfilePageUtility.profilePagePersonImage(imagePath),
          ProfilePageUtility.positionedIconButton(Icons.arrow_back_ios_outlined,() {Get.to(ParticipantProfilePage());}, 35, 360),
          ProfilePageUtility.positionedIconButton(Icons.edit_outlined, () {/* foto düzenleme */}, 235, 105),
          bigColumn(),
          isForParticipant == false
              ? scrollableNumberOfGroups()
              : const SizedBox(),
        ]),
      ),
    );
  }

  Padding bigColumn() {
    return Padding(
      padding: const EdgeInsets.only(top: 280),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 30,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ProfilePageUtility.informationTitle.length,
              itemBuilder: (context, index) {
                return textfieldRow(index, textfieldList[index]);
              },
            ),
            isForParticipant ? saveButton() : const SizedBox(),
            isForParticipant == false
                ? therapistSpecialColumn()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Positioned scrollableNumberOfGroups() {
    return Positioned(
      top: 665,
      right: 18,
      child: SizedBox(
        width: 70,
        height: 100,
        child: Transform.rotate(
          angle: -pi / 2,
          child: ListWheelScrollView.useDelegate(
            onSelectedItemChanged: (value) => therapistGroupController.scrollableWidgetFunction('number of groups', value),
            overAndUnderCenterOpacity: 0.75,
            itemExtent: 40,
            perspective: 0.002,
            diameterRatio: 0.9,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
                childCount: 21,
                builder: (context, index) {
                  return Center(
                    child: Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        color: Colors.transparent,
                        height: therapistProfileController.isNumberVisible.value
                            ? 20
                            : 0,
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Text(
                            (index).toString(),
                            style: const TextStyle(
                                color: AppColors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Column therapistSpecialColumn() {
    ProfilePageUtility profilePageUtility = ProfilePageUtility();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 335, child: profilePageUtility.acceptionRow(false)),
        const SizedBox(height: 10),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: AppColors.transparent,
            height: therapistProfileController.isNumberVisible.value ? 32 : 0,
            child: SizedBox(
              width: 325,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('''Yardımcı psikologluk yapabileceğim
grup sayısı'''),
                    Container(
                      height: 27,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.purple, width: 1)),
                    )
                  ]),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text('Hakkımda'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 325,
          child: TextField(
            controller: aboutMeController,
            decoration: const InputDecoration(fillColor: AppColors.white, filled: true),
            minLines: 5,
            maxLines: 50,
          ),
        ),
        saveButton(),
      ],
    );
  }

  Padding genderDrowDown() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 20),
      child: CustomDropDown(
        purpose: genderList,
        width: 195,
        height: 23,
      ),
    );
  }

  Padding saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 15),
      child: Center(
        child: CustomButton(
            textColor: AppColors.white,
            container: AppContainers.purpleButtonContainer(150),
            onTap: () {
              print(therapistProfileController.isBeingAdvisorAccepted.value);
            },
            text: 'Kaydet'),
      ),
    );
  }

  Center textfieldRow(int rowIndex, Widget textField) {
    return Center(
      child: SizedBox(
        width: 341,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ProfilePageUtility.informationTitle[rowIndex]),
            Align(
              alignment: Alignment.bottomRight,
              child: textField,
            )
          ],
        ),
      ),
    );
  }
}
