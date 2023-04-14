part of '../t_profile_settings_view.dart';

Widget _animatedNumberOfGroupsRow(
    BuildContext context, TProfileSettingsController therapistProfileController) {
  return Padding(
    padding: AppPaddings.componentPadding,
    child: Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: AppColors.transparent,
        height: therapistProfileController.isNumberVisible.value ? 37 : 1,
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
                Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: therapistProfileController.isNumberVisible.value ? 30 : 0,
                    width: SizeUtil.lowValueWidth,
                    decoration: AppBoxDecoration.purpleBorder,
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: CustomListWheelScrollView(
                whatIsFor: ScrollPurpose.groupNumber,
                onSelectedItemChanged: (value) => therapistProfileController.chooseGroupNumber(value),
                initialValue: 5, // kaydedilen grup sayısı gelecek
                isNumberVisible: therapistProfileController.isNumberVisible,))
        ]),
      ),
    ),
  );
}
