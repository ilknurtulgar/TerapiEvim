part of '../t_profile_settings_view.dart';

Padding _bigColumn(
    BuildContext context,
    TProfileSettingsController tProfileController,
    DropDownController dropDownController) {
  return Padding(
    padding: AppPaddings.profilePageBigPadding(true, true),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileSettingsList(
            profileController: tProfileController,
            dropDownController: dropDownController,
          ),
          specialColumn(context),
          smallSizedBox(),
        ],
      ),
    ),
  );
}
