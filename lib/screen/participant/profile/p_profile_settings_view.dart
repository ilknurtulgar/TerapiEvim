import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';
import 'package:terapievim/core/base/component/group/custom_list_wheel_scroll_view.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/profile/column_drop_down.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';
import '../../../controller/participant/profil/p_profile_controller.dart';
import '../../../controller/therapist/group/t_group_controller.dart';
import '../../../controller/therapist/profil/t_profile_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/component/profile/acception_row.dart';
import '../../../core/base/util/base_utility.dart';

import 'p_profile_view.dart';
import 'util/p_profile_view_utility.dart';
import 'util/p_textfield_utility.dart';

// ignore: must_be_immutable
class PProfileSettingsView extends StatelessWidget {
  PProfileSettingsView({
    super.key,
  });

  PTextfieldUtility textfieldUtility = PTextfieldUtility();
  PProfileController profileController = Get.put(PProfileController());
  TProfileController therapistProfileController = Get.find();
  TGroupController therapistGroupController = Get.find();
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
          PProfileViewUtility.backgroundOfTheView(),
          PProfileViewUtility.profilePagePersonImage(
              DemoInformation.profileImagePath, true,
              onPressed: () {/* foto edit */}),
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
                  ? context.push(const PProfileView())
                  : context.push(const TProfileView());
            },
            icon: IconUtility.back),
      ),
    );
  }

  Padding bigColumn(BuildContext context) {
    return Padding(
      padding: AppPaddings.profilePageBigPadding(true, true),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textfieldListView(),
            Obx(() => mainController.isTherapist.isFalse
                ? saveButton()
                : const SizedBox()),
            Obx(
              () => mainController.isTherapist.isTrue
                  ? therapistSpecialColumn(context)
                  : const SizedBox(),
            ),
            smallSizedBox(),
          ],
        ),
      ),
    );
  }

  ListView textfieldListView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ProfileSettingsTextUtil.informationTitle.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: AppPaddings.customContainerInsidePadding(2),
            child: SizedBox(
                width: Responsive.width(SizeUtil.generalWidth, context),
                child: textfieldList[index]));
      },
    );
  }

  Widget therapistSpecialColumn(BuildContext context) {
    return SizedBox(
      width: context.width1,
      child: Column(
        children: [
          AcceptionRow(isForMakingShortCall: false),
          animatedNumberOfGroupsRow(context),
          Align(
            alignment: Alignment.centerLeft,
            child: responsivenestext(
              TherapistProfileTextUtil.aboutMe,
              AppTextStyles.normalTextStyle('medium', false),
            ),
          ),
          Padding(
            padding: AppPaddings.componentPadding,
            child: SizedBox(
                child: CustomTextField(
              isBig: true,
              textController: DemoInformation.aboutMeController,
              isRowModel: false,
              isOne: true,
              maxLines: 5,
            )),
          ),
          saveButton(),
        ],
      ),
    );
  }

  Widget animatedNumberOfGroupsRow(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: AppColors.transparent,
          height: therapistProfileController.isNumberVisible.value ? 37 : 0,
          child: Stack(clipBehavior: Clip.none, children: [
            SizedBox(
              width: context.width1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: responsivenestext(
                          ProfileSettingsTextUtil.numberOfGroups,
                          const TextStyle())),
                  Container(
                    height: SizeUtil.lowValueHeight,
                    width: SizeUtil.lowValueWidth,
                    decoration: AppBoxDecoration.purpleBorder,
                  )
                ],
              ),
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
}
