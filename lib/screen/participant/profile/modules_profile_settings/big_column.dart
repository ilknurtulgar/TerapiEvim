part of '../p_profile_settings_view.dart';

Padding _bigColumn(
    BuildContext context,
    PProfileSettingsController pProfileController,) {
  return Padding(
    padding: AppPaddings.profilePageBigPadding(true, true),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileSettingsList(
              profileController: pProfileController,),
          SaveButton(onSaved: () {
            pProfileController.save();
          }),
          smallSizedBox(),
        ],
      ),
    ),
  );
}
