import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/group/custom_list_wheel_scroll_view.dart';
import 'package:terapievim/core/base/component/profile/column_drop_down.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/profile/therapist_profile_page.dart';
import '../../../controller/therapist_profile_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/component/profile/acception_row.dart';
import '../../../core/base/util/base_utility.dart';
import 'profile_page.dart';
import 'util/profile_page_utility.dart';
import 'util/textfield_utility.dart';

// ignore: must_be_immutable
class ParticipantProfileSettingPage extends StatelessWidget {
  ParticipantProfileSettingPage({
    super.key,
  });

  TextfieldUtility textfieldUtility = TextfieldUtility();
  ProfileController profileController = Get.put(ProfileController());
  TherapistProfileController therapistProfileController = Get.find();
  TherapistGroupController therapistGroupController = Get.find();
  MainController mainController = Get.find();
  late List<Widget> textfieldList = [
    textfieldUtility.nameSurnameTextfield(
        profileController.nameController, false),
    textfieldUtility.birthOfDateTextfield(
        profileController.birthdayController, false),
    //  ProfilePageUtility.genderDropDown(true, profileController.genderController),
    //TODO: commented temporarily. (03/04/23).
    const ColumnDropDown(
      isInProfilePage: true,
      title: "Cinsiyet",
    ),
    textfieldUtility.mailTextfield(profileController.emailController, false),
    textfieldUtility.passwordTextfield(
        profileController.passwordController, false),
    textfieldUtility.phoneTextfield(
        profileController.phoneNumberController, false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Stack(children: [
          ProfilePageUtility.backgroundOfThePage(),
          ProfilePageUtility.profilePagePersonImage(
            DemoInformation.profileImagePath,
            true,
            onPressed: () {
              /* foto edit */
            },
          ),
          getBackIconButton(context),
          bigColumn(context),
          /*DemoInformation.isForParticipant == false
              ? Positioned(
                  top: 940,
                  right: 25,
                  child: CustomListWheelScrollView(
                      whatIsFor: 'number of groups')) // eski değer 715
              : const SizedBox(),*/
        ]),
      ),
    );
  }

  Positioned getBackIconButton(BuildContext context) {
    return Positioned(
      top: Responsive.height(40, context),
      left: Responsive.width(20, context),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              mainController.isTherapist.isFalse
                  ? context.push(const ParticipantProfilePage())
                  : context.push(const TherapistProfilePage());
            },
            icon: IconUtility.back),
      ),
    );
  }

  Padding bigColumn(BuildContext context) {
    return Padding(
      padding: AppPaddings.profilePageBigPadding(false),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ProfileSettingsTextUtil.informationTitle.length,
              itemBuilder: (context, index) {
                return textfieldColumn(index, textfieldList[index]);
              },
            ),
            Obx(() => mainController.isTherapist.isFalse
                ? saveButton()
                : const SizedBox()),
            Obx(
              () => mainController.isTherapist.isTrue
                  ? therapistSpecialColumn(context)
                  : const SizedBox(),
            ),
            smallSizedBox(),
            // danışanın kaydet butonu aşağıya kayıyor buna bakılacak
          ],
        ),
      ),
    );
  }

  Widget therapistSpecialColumn(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
            width: Responsive.width(SizeUtil.generalWidth, context),
            child: AcceptionRow(isForMakingShortCall: false)),
        animatedNumberOfGroupsRow(context),
        Text(
          TherapistProfileTextUtil.aboutMe,
          style: AppTextStyles.normalTextStyle('medium', false),
        ),
        SizedBox(
          width: Responsive.width(SizeUtil.generalWidth, context),
          child: TextField(
            controller: DemoInformation.aboutMeController,
            decoration:
                const InputDecoration(fillColor: AppColors.white, filled: true),
            minLines: 5,
            maxLines: 50,
          ),
        ), // custom textfield about me için update edilince bunun yerine custom geleceği için extract etmedim
        saveButton(),
      ],
    );
  }

  Obx animatedNumberOfGroupsRow(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: AppColors.transparent,
        height: therapistProfileController.isNumberVisible.value ? 37 : 0,
        child: SizedBox(
          width: Responsive.width(SizeUtil.generalWidth, context),
          child: Stack(clipBehavior: Clip.none, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(ProfileSettingsTextUtil.numberOfGroups)),
                Container(
                  height: SizeUtil.lowValueHeight,
                  width: SizeUtil.lowValueWidth,
                  decoration: AppBoxDecoration.purpleBorder,
                )
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: CustomListWheelScrollView(whatIsFor: 'number of groups'))
          ]),
        ),
      ),
    );
  }

  Widget saveButton() {
    return Padding(
      padding: AppPaddings.pagePadding,
      child: CustomButton(
          textColor: AppColors.white,
          container:
              AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth),
          onTap: () {
            profileController.save();
          },
          text: ProfileSettingsTextUtil.save),
    );
  }

  Center textfieldColumn(int rowIndex, Widget textField) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(ProfileSettingsTextUtil.informationTitle[rowIndex]),
          Padding(
              padding: AppPaddings.customContainerInsidePadding(2),
              child: textField)
        ],
      ),
    );
  }
}
