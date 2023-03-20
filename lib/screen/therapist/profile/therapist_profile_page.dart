import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/custom_list_view.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import '../../../core/base/component/home/custom_container.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../participant/profile/profile_setting_page.dart';
import '../../participant/profile/util/profile_page_utility.dart';

class TherapistProfilePage extends StatelessWidget {
  const TherapistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ProfilePageUtility.backgroundOfThePage(),
              ProfilePageUtility.profilePagePersonImage(
                  DemoInformation.imagePath),
              ProfilePageUtility.positionedIconButton(
                  IconUtility.settingIcon.icon!,
                  () => context.push(ParticipantProfileSettingPage()),
                  50,
                  10),
              Padding(
                padding: AppPaddings.profilePageBigPadding(true),//left padding genel page padding zamanında kaldırılacak
                child: Column(
                  children: [
                    therapistName(),
                    smallSizedBox(),
                    aboutMeColumn(),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.myGroups, 'group', () {}),
                    ProfilePageListView(
                      isForParticipant: false,
                      isForMethod: false,
                      firstRowTextList: DemoInformation.advisorNames,
                      secondRowTextList: DemoInformation.dates,
                      groupNameList: DemoInformation.groupNameList,
                    ),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.methods, 'method', () {}),
                    ProfilePageListView(
                        isForParticipant: false,
                        isForMethod: true,
                        firstRowTextList: DemoInformation.groupNameList,
                        secondRowTextList: DemoInformation.methodNames),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.seminars, 'seminar', () {}),
                    ProfilePageListView(
                      isForParticipant: false,
                      isForMethod: false,
                      firstRowTextList: DemoInformation.seminarNames,
                      secondRowTextList: DemoInformation.dates,
                    ),
                    mediumSizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding therapistName() {
    return Padding(
      padding: AppPaddings.mediumPadding(1),
      child: Center(
        child: Text(
          DemoInformation.name,
          style: AppTextStyles.aboutMeTextStyle(true),
        ),
      ),
    );
  }

  Widget aboutMeColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TherapistProfileTextUtil.aboutMe,
          style: AppTextStyles.profileTextStyles(false, true),
        ),
        smallSizedBox(),
        aboutMeContainer(),
        smallSizedBox(),
      ],
    );
  }

  Widget aboutMeContainer() {
    return CustomContainer(
      containerModel: AppContainers.classicWhiteContainer,
      isThereCardModel: false,
      widget: Padding(
        padding: AppPaddings.customContainerInsidePadding(3),
        child: Text(
          DemoInformation.aboutMeController.text,
          style: AppTextStyles.normalTextStyle('medium', false),
        ),
      ),
    );
  }
}
