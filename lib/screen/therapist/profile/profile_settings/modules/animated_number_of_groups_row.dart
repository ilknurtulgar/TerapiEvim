part of '../t_profile_settings_view.dart';

Widget _animatedNumberOfGroupsRow(
    BuildContext context, TProfileSettingsController therapistProfileController) {
  return Padding(
    padding: AppPaddings.componentPadding,
    child: Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: AppColors.transparent,
        height: therapistProfileController.isNumberVisible.value ? 37 : 0.00001,
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
                Container(
                  height: SizeUtil.lowValueHeight,
                  width: SizeUtil.lowValueWidth,
                  decoration: AppBoxDecoration.purpleBorder,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: CustomListWheelScrollView(
                whatIsFor: ScrollPurpose.groupNumber,
                onSelectedItemChanged: (value) => therapistProfileController.chooseGroupNumber(value),
                isNumberVisible: therapistProfileController.isNumberVisible,))
        ]),
      ),
    ),
  );
}
