import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/profil/t_profile_settings_controller.dart';
import '../../../../core/base/component/buttons/save_button.dart';
import '../../../../core/base/component/group/custom_list_wheel_scroll_view.dart';
import '../../../../core/base/component/login/custom_textfield.dart';
import '../../../../core/base/component/profile/acception_row.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/widget/common/profile/profile_back_button.dart';
import '../../../../product/widget/common/profile/profile_settings_list.dart';
import '../../../participant/profile/util/p_profile_view_utility.dart';
part 'modules/animated_number_of_groups_row.dart';
part 'modules/big_column.dart';
part 'modules/special_column.dart';

class TProfileSettingsView extends StatelessWidget {
  const TProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TProfileSettingsController>(
      getController: TProfileSettingsController(),
      onPageBuilder: (context, controller) => Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                PProfileViewUtility.backgroundOfTheView(),
                PProfileViewUtility.profilePagePersonImage(controller.imageUrl, true, onPressed: () {controller.pickImage();}),
                ProfileBackIconButton(onTap: () => Get.back(),),
                _bigColumn(context, controller),
                /*DemoInformation.isForParticipant == false
                  ? Positioned(
                      top: 940,
                      right: 25,
                      child: CustomListWheelScrollView(
                          whatIsFor: 'number of groups')) // eski değer 715
                  : const SizedBox(),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
