import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main_controller.dart';
import '../../../controller/participant/profil/p_profile_controller.dart';
import '../../../core/base/component/group/group.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/profile/custom_list_view.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../therapist/profile/t_profile_view.dart';
import 'p_attended_seminars_view.dart';
import 'p_last_review_view.dart';
import 'settings/p_settings_view.dart';
import 'util/p_profile_view_utility.dart';

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
                        nameAndBirthDateColumn(controller),
                        smallSizedBox(),
                        participantGroupColumn(controller),
                        mediumSizedBox(),
                        UiBaseModel.boldMainTitleRowView(
                            ParticipantProfileTextUtil.lastRead,
                            MainTitles.methods, () {
                          context.push(const PLastReviewView());
                        }),
                        methodListview(controller),
                        mediumSizedBox(),
                        UiBaseModel.boldMainTitleRowView(
                            ParticipantProfileTextUtil.joinedSeminars,
                            MainTitles.seminars, () {
                          context.push(const PAttendedSeminarsView());
                        }),
                        seminarsListview(controller),
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

  Obx seminarsListview(PProfileController controller) {
    return Obx(
      () => controller.listOfActivities.isNotEmpty
          ? ProfileViewListView(
              isForParticipant: true,
              isForMethod: false,
              firstRowTextList: controller.listOfActivities.getTherapistNames,
              secondRowTextList: controller.listOfActivities.getTitles,
              onTap: () {},
            )
          : const SizedBox(),
    );
  }

  Obx methodListview(PProfileController controller) {
    return Obx(
      () => controller.listOfCopingMethods.isNotEmpty
          ? ProfileViewListView(
              isForParticipant: true,
              isForMethod: true,
              mainTherapistName:
                  controller.listOfCopingMethods.getTherapist.title,
              secondRowTextList: controller.listOfCopingMethods.getMethodTitles,
              onTap: () {},
            )
          : const SizedBox(),
    );
  }

  Column participantGroupColumn(PProfileController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowView(
            rowModel: UiBaseModel.normalTextRow(
                ParticipantProfileTextUtil.myActiveGroup,
                IconUtility.navGroup,
                AppTextStyles.profileTextStyles(true, true)),
            padding: EdgeInsets.zero),
        participantGroupContainer(controller),
      ],
    );
  }

  Widget participantGroupContainer(PProfileController controller) {
    MainController mainController = Get.find();
    return GroupClass(
      width: SizeUtil.highestValueWidth,
      isBorderPurple: true,
      heading: controller.myGroup.value?.name ?? "",
      onTap: () => mainController.onPageChanged(2),
      row1: UiBaseModel.doubleTextRow(ParticipantProfileTextUtil.mainTherpist,
          DemoInformation.groupInformation.mainTherapistName, true),
      row2: UiBaseModel.doubleTextRow(
          ParticipantProfileTextUtil.advisor,
          controller.myGroup.value?.therapistHelperName ?? "Bekleniyor..",
          true),
      row3: UiBaseModel.normalTextRow(
          controller.myGroup.value!.dateTime.toString(),
          IconUtility.clockIcon.icon!,
          AppTextStyles.normalTextStyle('medium', false)),
    );
  }

  Padding nameAndBirthDateColumn(PProfileController controller) {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          responsivenestext(
            controller.name,
            AppTextStyles.normalTextStyle('big', false),
          ),
          responsivenestext(controller.birthday,
              AppTextStyles.normalTextStyle('medium', false)),
        ],
      ),
    );
  }
}
