import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/core/managers/converter/date_time_manager.dart';
import 'package:terapievim/product/widget/common/empty_sized_box_text.dart';

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
  PProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PProfileController>(
        getController: PProfileController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            backgroundColor: AppColors.blueChalk,
            body: SingleChildScrollView(
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
                      huge2xSizedBox(),
                    ],
                  ),
                ),
              ]),
            ),
          );
        });
  }

  Widget seminarsListview(PProfileController controller) {
    return
        //  () => controller.listOfActivities.isNotEmpty
        ProfileViewListView(
      isForParticipant: true,
      isForMethod: false,
      firstRowTextList: profileSeminar,
      //controller.listOfActivities.getTherapistNames,
      secondRowTextList: profileSecond,
      //controller.listOfActivities.getTitles,
      onTap: () {
        flutterErrorToast("Kayıt bulunamamaktadır");
      },
    );
  }

  Widget methodListview(PProfileController controller) {
    return
        //  () => controller.listOfCopingMethods.isNotEmpty
        ProfileViewListView(
      isForParticipant: true,
      isForMethod: true,
      mainTherapistName: "Rumeysa Kara ",
      // controller.listOfCopingMethods.getTherapist.title,
      secondRowTextList: dateTime,
      // controller.listOfCopingMethods.getMethodTitles,
      onTap: () {
        flutterErrorToast("Kayıt bulunmamaktadır");
      },

      //  : const EmptySizedBoxText(),
    );
  }

  final List explanationList = [
    "Baş etme metotunu incelemeyi unutmayınız",
    "Stres ile ilgili metotu incelemenizi öneririm",
    "Nefes egzersizlerini yapmanızı tavsiye ederim",
    "Stres yazısnı okumanızı öneririm"
  ];

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
    return Obx(() => controller.myGroup.value?.id != null
        ? GroupClass(
            width: SizeUtil.hugeValueWidth,
            isBorderPurple: true,
            heading: controller.myGroup.value?.name ?? "",
            onTap: () => mainController.onPageChanged(2),
            row1: UiBaseModel.doubleTextRow(
                ParticipantProfileTextUtil.mainTherpist,
                controller.myGroup.value?.therapistName ?? "",
                true),
            row2: UiBaseModel.doubleTextRow(
                ParticipantProfileTextUtil.advisor,
                controller.myGroup.value?.therapistHelperName ?? "Bekleniyor..",
                true),
            row3: UiBaseModel.normalTextRow(
                DateTimeManager.getFormattedDateFromFormattedString(
                  value: controller.myGroup.value?.dateTime
                      ?.toDate()
                      .toIso8601String(),
                ),
                IconUtility.clockIcon.icon!,
                AppTextStyles.normalTextStyle('medium', false)),
          )
        : const EmptySizedBoxText());
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

List<String> profileSeminar = ["Terapi Etkileri  ", "Stres İle Başa Çıkma"];
List<String> profileSecond = ["11.22.10 22:10", "10.05.23 15:00"];
List<String> dateTime = [
  "11.02.23 11:10",
  "10.22.22 12:22",
  "11.15.23 20:10",
  "05.08.22 13:10"
];
