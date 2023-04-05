import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/participant/profil/p_profile_controller.dart';
import '../../../controller/therapist/profil/t_profile_controller.dart';
import '../../../core/base/component/buttons/save_button.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../product/widget/common/profile/profile_back_button.dart';
import '../../../product/widget/common/profile/profile_settings_list.dart';
import 'p_profile_view.dart';
import 'util/p_profile_view_utility.dart';

part 'modules_profile_settings/big_column.dart';

// ignore: must_be_immutable
class PProfileSettingsView extends StatelessWidget {
  PProfileSettingsView({
    super.key,
  });

  TProfileController therapistProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseView<PProfileController>(
      getController: PProfileController(),
      onPageBuilder: (context, controller) => Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                PProfileViewUtility.backgroundOfTheView(),
                PProfileViewUtility.profilePagePersonImage(
                  DemoInformation.profileImagePath,
                  true,
                  onPressed: () {},
                ),
                ProfileBackIconButton(
                  onTap: () {
                    context.push(const PProfileView());
                  },
                ),
                _bigColumn(context, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
