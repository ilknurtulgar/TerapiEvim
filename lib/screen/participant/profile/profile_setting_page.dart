import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/group/custom_list_wheel_scroll_view.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
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
  ProfileController profileController = Get.find();
  TherapistProfileController therapistProfileController = Get.find();
  TherapistGroupController therapistGroupController = Get.find();

  late List<Widget> textfieldList = [
    textfieldUtility.nameSurnameTextfield(
        DemoInformation.nameSurnameControllerInSetting, false),
    textfieldUtility.birthOfDateTextfield(
        profileController.birthOfDateController.value, false),
    ProfilePageUtility.genderDropDown(true),
    textfieldUtility.mailTextfield(
        DemoInformation.mailControllerInSetting, false),
    textfieldUtility.passwordTextfield(
        DemoInformation.passwordControllerInSetting, false),
    textfieldUtility.phoneTextfield(
        DemoInformation.phoneControllerInSetting, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        child: Stack(children: [
          ProfilePageUtility.backgroundOfThePage(),
          ProfilePageUtility.profilePagePersonImage(
              DemoInformation.profileImagePath),
          ProfilePageUtility.positionedIconButton(IconUtility.forward.icon!,
              () {
            context.push(const ParticipantProfilePage());
          }, 35, 340),
          ProfilePageUtility.positionedIconButton(IconUtility.editPencil.icon!,
              () {/* foto düzenleme */}, 260, 100),
          bigColumn(),
          DemoInformation.isForParticipant == false
              ? Positioned(
                  top: 855,
                  right: 10,
                  child: CustomListWheelScrollView(
                      whatIsFor: 'number of groups')) // eski değer 715
              : const SizedBox(),
        ]),
      ),
    );
  }

  Padding bigColumn() {
    return Padding(
      padding: AppPaddings.profilePageBigPadding(false),
      child: Center(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ProfileSettingsTextUtil.informationTitle.length,
              itemBuilder: (context, index) {
                return textfieldRow(index, textfieldList[index]);
              },
            ),
            DemoInformation.isForParticipant ? saveButton() : const SizedBox(),
            DemoInformation.isForParticipant == false
                ? therapistSpecialColumn()
                : const SizedBox(),
            smallSizedBox()
            // danışanın kaydet butonu aşağıya kayıyor buna bakılacak
          ],
        ),
      ),
    );
  }

  Center therapistSpecialColumn() {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        children: [
          SizedBox(
              width: SizeUtil.generalWidth,
              child: AcceptionRow(isForMakingShortCall: false)),
          animatedNumberOfGroupsRow(),
          Text(
            TherapistProfileTextUtil.aboutMe,
            style: AppTextStyles.normalTextStyle('medium', false),
          ),
          SizedBox(
            width: SizeUtil.generalWidth,
            child: TextField(
              controller: DemoInformation.aboutMeController,
              decoration: const InputDecoration(
                  fillColor: AppColors.white, filled: true),
              minLines: 5,
              maxLines: 50,
            ),
          ), // custom textfield about me için update edilince bunun yerine custom geleceği için extract etmedim
          saveButton(),
        ],
      ),
    );
  }

  Obx animatedNumberOfGroupsRow() {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: AppColors.transparent,
        height: therapistProfileController.isNumberVisible.value ? 32 : 0,
        child: SizedBox(
          width: SizeUtil.generalWidth,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(ProfileSettingsTextUtil.numberOfGroups),
            Container(
              height: SizeUtil.miniContainerHeight,
              width: SizeUtil.lowValueWidth,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppBorderRadius.generalBorderRadius,
                  border:
                      Border.all(color: AppColors.cornFlowerBlue, width: 1)),
            )
          ]),
        ),
      ),
    );
  }

  Padding saveButton() {
    return Padding(
      padding: AppPaddings.smallPadding(2),
      child: Center(
        child: CustomButton(
            textColor: AppColors.white,
            container: AppContainers.purpleButtonContainer(150),
            onTap: () {},
            text: ProfileSettingsTextUtil.save),
      ),
    );
  }

  Center textfieldRow(int rowIndex, Widget textField) {
    return Center(
      child: SizedBox(
        width: SizeUtil.generalWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ProfileSettingsTextUtil.informationTitle[rowIndex]),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: AppPaddings.smallVerticalPadding, child: textField),
            )
          ],
        ),
      ),
    );
  }
}
