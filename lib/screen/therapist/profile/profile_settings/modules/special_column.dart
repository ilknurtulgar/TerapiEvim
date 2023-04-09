part of '../t_profile_settings_view.dart';

Widget specialColumn(
  BuildContext context,
) {
  TProfileSettingsController therapistProfileController = Get.find();
  return SizedBox(
    width: context.width1,
    child: Column(
      children: [
        Obx(
          () => AcceptionRow(
            isForMakingShortCall: false,
            acceptionFunction: () =>
                therapistProfileController.acceptionFunction(),
            value: therapistProfileController.isBeingAdvisorAccepted.value,
          ),
        ),
        _animatedNumberOfGroupsRow(context, therapistProfileController),
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
            textController: therapistProfileController.aboutMeController,
            isRowModel: false,
            isOne: true,
            maxLines: 5,
          )),
        ),
        SaveButton(onSaved: () {
          therapistProfileController.save();
        }),
      ],
    ),
  );
}
