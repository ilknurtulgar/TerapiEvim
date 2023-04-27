import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/therapist/coping_method/t_coping_method_model.dart';
import '../../../controller/main_controller.dart';
import '../../../controller/therapist/profil/t_profile_controller.dart';
import '../../../core/base/component/profile/custom_list_view.dart';
import '../../../core/base/ui_models/card_model.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/managers/converter/date_time_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import 'settings/t_settings_view.dart';
import 't_attended_seminar_view.dart';
import '../../participant/profile/util/p_profile_view_utility.dart';
import 't_dealing_method_view.dart';

// ignore: must_be_immutable
class TProfileView extends StatelessWidget {
  TProfileView({super.key});
  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseView<TProfileController>(
        getController: TProfileController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            backgroundColor: AppColors.blueChalk,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    PProfileViewUtility.backgroundOfTheView(),
                    PProfileViewUtility.profilePagePersonImage(
                        controller.imageUrl, false),
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
                          mediumSizedBox(),
                          UiBaseModel.boldMainTitleRowView(
                              TherapistProfileTextUtil.methods,
                              MainTitles.methods, () {
                            context.push(const TDealingMethodView());
                          }),
                          methodsListview(controller),
                          mediumSizedBox(),
                          UiBaseModel.boldMainTitleRowView(
                              TherapistProfileTextUtil.seminars,
                              MainTitles.seminars, () {
                            context.push(const TAttendedSeminarsView());
                          }),
                          seminarsListview(controller),
                          mediumSizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Obx seminarsListview(TProfileController controller) {
    return Obx(
      () => controller.listOfActivities.isNotEmpty
          ? ProfileViewListView(
              isForParticipant: false,
              isForMethod: false,
              firstRowTextList: controller.listOfActivities.getTitles,
              secondRowTextList: controller.listOfActivities.getDates,
              onTap: () {},
            )
          : const SizedBox(),
    );
  }

  Obx methodsListview(TProfileController controller) {
    return Obx(
      () => controller.listOfCopingMethods.isNotEmpty
          ? ProfileViewListView(
              isForParticipant: false,
              isForMethod: true,
              firstRowTextList: controller.listOfCopingMethods.getGroupNames,
              secondRowTextList: controller.listOfCopingMethods.getMethodTitles,
              onTap: () {},
            )
          : const SizedBox(),
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
            controller.aboutMe.value != ''
                ? controller.aboutMe.value
                : TherapistProfileTextUtil.aboutMeEmpty,
            style: AppTextStyles.normalTextStyle('medium', false),
          ),
        ),
      ),
    );
  }
}

enum MainTitles { groups, methods, seminars }

extension ActivitiesInProfileExtension on RxList<TActivityModel?> {
  List<String> get getTherapistNames {
    List<String> names = [];
    this.forEach((element) {
      names.add(element?.therapistName ?? EmptyTextUtil.emptyText);
    });
    return names;
  }

  List<String> get getTitles {
    List<String> titles = [];
    this.forEach((element) {
      titles.add(element?.title ?? EmptyTextUtil.emptyText);
    });
    return titles;
  }

  List<String> get getDates {
    List<String> dates = [];
    this.forEach((element) {
      dates.add(DateTimeManager.getFormattedDateFromFormattedString(
        value: element?.dateTime!.toDate().toIso8601String(),
      ));
    });
    return dates;
  }
}

extension CopingMethodsInProfileExtension on RxList<TCopingMethodModel?> {
  List<String> get getGroupNames {
    List<String> groupName = [];
    this.forEach((element) {
      groupName.add(element?.groupName ?? EmptyTextUtil.emptyText);
    });
    return groupName;
  }

  List<String> get getMethodTitles {
    List<String> titles = [];
    this.forEach((element) {
      titles.add(element?.title ?? EmptyTextUtil.emptyText);
    });
    return titles;
  }

  List<String> get getTimes {
    List<String> timeList = [];
    this.forEach((element) {
      timeList.add(DateTimeManager.getFormattedDateFromFormattedString(
          value: element?.dateTime!.toDate().toIso8601String()));
    });
    return timeList;
  }

  List<String> get getExplanations {
    List<String> explanations = [];
    this.forEach((element) {
      explanations.add(element?.description ?? EmptyTextUtil.emptyText);
    });
    return explanations;
  }

  CardModel get getTherapist {
    return CardModel(
        imagePath: this.first?.therapistAvatarUrl ?? "",
        title: this.first?.therapistName ?? EmptyTextUtil.emptyText);
  }
}
