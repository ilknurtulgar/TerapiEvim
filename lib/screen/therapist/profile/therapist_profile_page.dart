import 'package:flutter/material.dart';

import '../../../core/base/component/profile/custom_list_view.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../../../screen/therapist/profile/t_attended_seminar.dart';
import '../../../screen/therapist/profile/t_dealing_method.dart';
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
                  DemoInformation.imagePath, false),
              ProfilePageUtility.positionedIconButton(
                  IconUtility.settingIcon.icon!,
                  () => context.push(ParticipantProfileSettingPage()),
                  Responsive.height(40, context),
                  Responsive.width(20, context)),
              Padding(
                padding: AppPaddings.profilePageBigPadding(true, false),
                //left padding genel page padding zamanında kaldırılacak
                child: Column(
                  children: [
                    therapistName(),
                    mediumSizedBox(),
                    //smallSizedBox(),
                    aboutMeColumn(),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.myGroups, 'group', () {
                      //nasil gidecek
                    }),
                    ProfilePageListView(
                      isForParticipant: false,
                      isForMethod: false,
                      firstRowTextList: DemoInformation.advisorNames,
                      secondRowTextList: DemoInformation.dates,
                      groupNameList: DemoInformation.groupNameList,
                    ),
                    mediumSizedBox(),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.methods, 'method', () {
                      context.push(TDealingMethod());
                    }),
                    ProfilePageListView(
                        isForParticipant: false,
                        isForMethod: true,
                        firstRowTextList: DemoInformation.groupNameList,
                        secondRowTextList: DemoInformation.methodNames),
                    mediumSizedBox(),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.seminars, 'seminar', () {
                      context.push(TAttendedSeminars());
                    }),
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
      padding: AppPaddings.componentOnlyPadding(3),
      child: Center(
        child: responsivenestext(
          DemoInformation.name,
          AppTextStyles.aboutMeTextStyle(true),
        ),
      ),
    );
  }

  Widget aboutMeColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsivenestext(
          TherapistProfileTextUtil.aboutMe,
          AppTextStyles.profileTextStyles(false, true),
        ),
        mediumSizedBox(),
        aboutMeContainer(),
      ],
    );
  }

  Widget aboutMeContainer() {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(3),
      child: Container(
        decoration: AppBoxDecoration.purpleBorder,
        child: Padding(
          padding: AppPaddings.customContainerInsidePadding(3),
          child: Text(
            DemoInformation.aboutMeController.text,
            style: AppTextStyles.normalTextStyle('medium', false),
          ),
        ),
      ),
    );
  }
}
