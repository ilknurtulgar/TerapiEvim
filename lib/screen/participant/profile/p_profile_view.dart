import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/custom_list_view.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/core/base/ui_models/group_model.dart';
import 'package:terapievim/screen/participant/profile/p_last_review_view.dart';
import 'package:terapievim/screen/participant/profile/settings/p_settings_view.dart';
import '../../../controller/participant/profil/p_profile_controller.dart';
import '../../../core/base/component/group/group.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/view/base_view.dart';
import 'util/p_profile_view_utility.dart';
import 'p_attended_seminars_view.dart';

class PProfileView extends StatelessWidget {
  const PProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PProfileController>(
        getController: PProfileController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            backgroundColor: AppColors.blueChalk,
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(children: [
                  PProfileViewUtility.backgroundOfTheView(),
                  PProfileViewUtility.positionedIconButton(
                      IconUtility.settingIcon.icon!,

                      () => context.push(PSettingsView()),
                      Responsive.height(40, context),

                      Responsive.width(20, context)),
                  PProfileViewUtility.profilePagePersonImage(
                      controller.imageUrl, false),
                  Padding(
                    padding: AppPaddings.profilePageBigPadding(true, false),
                    child: Column(
                      children: [
                        nameAndBirthDateColumn(),
                        smallSizedBox(),
                        participantGroupColumn(),
                        mediumSizedBox(),
                        UiBaseModel.boldMainTitleRowView(
                            ParticipantProfileTextUtil.lastRead, 'method', () {
                          context.push(const PLastReviewView());
                        }),
                        ProfileViewListView(
                          isForParticipant: true,
                          isForMethod: true,
                          mainTherapistName: DemoInformation
                              .groupInformation.mainTherapistName,
                          secondRowTextList:
                              DemoInformation.groupInformation.methodTitles,
                        ),
                        mediumSizedBox(),
                        UiBaseModel.boldMainTitleRowView(
                            ParticipantProfileTextUtil.joinedSeminars,
                            'seminar', () {
                          context.push(const PAttendedSeminarsView());
                        }),
                        ProfileViewListView(
                            isForParticipant: true,
                            isForMethod: false,
                            firstRowTextList: DemoInformation
                                .lastWatchedSeminars
                                .getSeminarsTherapistName(),
                            secondRowTextList: DemoInformation
                                .lastWatchedSeminars
                                .getSeminarTitles()),
                        mediumSizedBox(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }

  Column participantGroupColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowView(
            UiBaseModel.normalTextRow(
                ParticipantProfileTextUtil.myActiveGroup,
                IconUtility.navGroup,
                AppTextStyles.profileTextStyles(true, true)),
            EdgeInsets.zero),
        participantGroupContainer(),
      ],
    );
  }

  Widget participantGroupContainer() {
    return GroupClass(
      width: SizeUtil.highestValueWidth,
      isBorderPurple: true,
      heading: DemoInformation.groupInformation.groupName,
      onTap: () {}, // navigate to group page
      row1: UiBaseModel.doubleTextRow(ParticipantProfileTextUtil.mainTherpist,
          DemoInformation.groupInformation.mainTherapistName, true),
      row2: UiBaseModel.doubleTextRow(ParticipantProfileTextUtil.advisor,
          DemoInformation.groupInformation.secondTherapistName, true),
      row3: UiBaseModel.normalTextRow(
          DemoInformation.groupInformation.therapyTime,
          IconUtility.clockIcon.icon!,
          AppTextStyles.normalTextStyle('medium', false)),
    );
  }

  Padding nameAndBirthDateColumn() {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          responsivenestext(
            DemoInformation.nameSurname,
            AppTextStyles.normalTextStyle('big', false),
          ),
          responsivenestext(DemoInformation.birthOfDate,
              AppTextStyles.normalTextStyle('medium', false)),
        ],
      ),
    );
  }
}

extension SeminarListExtension on List<SeminarModelInProfileView> {
  List<String> getSeminarTitles() {
    int i = 0;
    List<String> seminarTitles = [];
    for (i = 0; i < length; i++) {
      seminarTitles.add(this[i].seminarTitle);
    }
    return seminarTitles;
  }

  List<String> getSeminarsTherapistName() {
    int i = 0;
    List<String> therapistList = [];
    for (i = 0; i < length; i++) {
      therapistList.add(this[i].therapistName);
    }
    return therapistList;
  }
}
