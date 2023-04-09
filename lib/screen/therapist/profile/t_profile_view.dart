import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/main_controller.dart';
import '../../../controller/therapist/profil/t_profile_controller.dart';
import '../../../core/base/component/profile/custom_list_view.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import 'settings/t_settings_view.dart';
import 't_attended_seminar_view.dart';
import '../../participant/profile/util/p_profile_view_utility.dart';
import 't_dealing_method_view.dart';

// ignore: must_be_immutable
class TProfileView extends StatelessWidget {
  TProfileView({super.key});
  MainController mainController=Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseView<TProfileController>(
      getController: TProfileController(),
      onModelReady: (model){},
      onPageBuilder: (context,controller) {
        return Scaffold(
          backgroundColor: AppColors.blueChalk,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  PProfileViewUtility.backgroundOfTheView(),
                  PProfileViewUtility.profilePagePersonImage(controller.imageUrl,false),
                  PProfileViewUtility.positionedIconButton(
                      IconUtility.settingIcon.icon!,
                      () => context.push(const TSettingsView()),
                      Responsive.height(40, context),
                      Responsive.width(20, context)),
                  Padding(
                    padding: AppPaddings.profilePageBigPadding(true, false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        therapistName(controller),
                        mediumSizedBox(),
                        aboutMeColumn(controller),
                        UiBaseModel.boldMainTitleRowView(
                            TherapistProfileTextUtil.myGroups,MainTitles.groups, () => mainController.onPageChanged(2)),
                        ProfileViewListView(
                          isForParticipant: false,
                          isForMethod: false,
                          firstRowTextList: DemoInformation.advisorNames,
                          secondRowTextList: DemoInformation.dates,
                          groupNameList: DemoInformation.groupNameList,
                        ),
                        mediumSizedBox(),
                        UiBaseModel.boldMainTitleRowView(
                            TherapistProfileTextUtil.methods,MainTitles.methods, () {
                          context.push(const TDealingMethodView());
                        }),
                        ProfileViewListView(
                            isForParticipant: false,
                            isForMethod: true,
                            firstRowTextList: DemoInformation.groupNameList,
                            secondRowTextList: DemoInformation.methodNames),
                        mediumSizedBox(),
                        UiBaseModel.boldMainTitleRowView(
                            TherapistProfileTextUtil.seminars,MainTitles.seminars, () {
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
    );
  }

  Padding therapistName(TProfileController controller) {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(3),
      child: Center(
        child: responsivenestext(
          controller.name,
          AppTextStyles.aboutMeTextStyle(true),
        ),
      ),
    );
  }

  Widget aboutMeColumn(TProfileController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsivenestext(
          TherapistProfileTextUtil.aboutMe,
          AppTextStyles.profileTextStyles(false, true),
        ),
        mediumSizedBox(),
        aboutMeContainer(controller),
      ],
    );
  }

  Widget aboutMeContainer(TProfileController controller) {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(3),
      child: Container(
        decoration: AppBoxDecoration.purpleBorder,
        child: Padding(
          padding: AppPaddings.customContainerInsidePadding(3),
          child: Text(
            controller.aboutMe.value,
            style: AppTextStyles.normalTextStyle('medium', false),
          ),
        ),
      ),
    );
  }
}

enum MainTitles{
  groups,
  methods,
  seminars
}
