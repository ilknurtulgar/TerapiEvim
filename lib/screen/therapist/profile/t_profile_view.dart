import 'package:flutter/material.dart';
import 'package:terapievim/screen/therapist/profile/settings/t_settings_view.dart';
import 'package:terapievim/screen/therapist/profile/t_dealing_method_view.dart';

import '../../../core/base/component/profile/custom_list_view.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import 't_attended_seminar_view.dart';

import '../../participant/profile/util/p_profile_view_utility.dart';

class TProfileView extends StatelessWidget {
  const TProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              PProfileViewUtility.backgroundOfTheView(),
              PProfileViewUtility.profilePagePersonImage(
                  DemoInformation.imagePath, false),
              PProfileViewUtility.positionedIconButton(
                  IconUtility.settingIcon.icon!,
                  () => context.push(const TSettingsView()),
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
                    ProfileViewListView(
                      isForParticipant: false,
                      isForMethod: false,
                      firstRowTextList: DemoInformation.advisorNames,
                      secondRowTextList: DemoInformation.dates,
                      groupNameList: DemoInformation.groupNameList,
                    ),
                    mediumSizedBox(),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.methods, 'method', () {
                      context.push(const TDealingMethodView());
                    }),
                    ProfileViewListView(
                        isForParticipant: false,
                        isForMethod: true,
                        firstRowTextList: DemoInformation.groupNameList,
                        secondRowTextList: DemoInformation.methodNames),
                    mediumSizedBox(),
                    UiBaseModel.boldMainTitleRowView(
                        TherapistProfileTextUtil.seminars, 'seminar', () {
                      context.push(const TAttendedSeminarsView());
                    }),
                    ProfileViewListView(
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
