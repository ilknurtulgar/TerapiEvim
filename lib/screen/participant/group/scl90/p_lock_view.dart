import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';

import '../../../../controller/participant/group/p_lock_screen_controller.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/group/purple_text_container.dart';
import '../../../../core/base/component/profile/container/two_row_short_container.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../category_determination/group_categories/p_group_categories_view.dart';
import 'p_test_for_users_view.dart';

class PLockView extends StatelessWidget {
  const PLockView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PLockScreenController>(
        getController: PLockScreenController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const PMyGroupView(),
                Container(
                  color: Colors.black.withOpacity(0.8),
                ),
                popUp(controller, context)
              ],
            ),
          );
        });
  }

  BackdropFilter popUp(PLockScreenController controller, BuildContext context) {
    return BackdropFilter(
      filter: Filter.blur,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.isTestResultReady.isTrue
                ? IconUtility.lockopen
                : IconUtility.lock(true),
            controller.isTestNotSolved.isTrue
                ? noTest(context)
                : controller.isTestResultReady.isTrue
                    ? checkedTest(context)
                    : uncheckedTest()
          ]),
    );
  }

  Column checkedTest(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        lockedTextContainer(GroupTextUtil.lockScreencheckedTestString, false),
        CustomButton(
            textColor: Colors.white,
            container:
                AppContainers.purpleButtonContainer(SizeUtil.largeValueWidth),
            onTap: () {
              context.push(const PGroupCategoriesView());
            },
            text: "Grup Kategori Sayfasi ")
      ],
    );
  }

  Column uncheckedTest() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        lockedTextContainer(GroupTextUtil.lockScreenText, true),
        TwoRowShortContainer(
          firstIconData: IconUtility.navProfile,
          row1Text: GroupTextUtil.therapistTwoDot + "Yesim Salkim",
          purpose: ContainerPurpose.seminar,
          secondIconData: IconUtility.navActivities,
          row2Text: "12/2/2222 20.00",
          buttonText: GroupTextUtil.join,
          firstOnTap: () {},
        )
      ],
    );
  }

  Column noTest(BuildContext context) {
    return Column(
      children: [
        lockedTextContainer(GroupTextUtil.lockScreenText, false),
        const PurpleTextContainer(text: GroupTextUtil.lockScreenText),
        testButton(context)
      ],
    );
  }

  GestureDetector testButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push(const PTestView());
        },
        child: Container(
          margin:
              const EdgeInsets.symmetric(vertical: SizeUtil.smallValueHeight),
          width: SizeUtil.largeValueWidth,
          height: SizeUtil.smallValueHeight,
          decoration: AppBoxDecoration.lockScreenButton,
          child: Center(
            child: Text(GroupTextUtil.lockScreenbuttonText,
                style: AppTextStyles.buttonTextStyle(AppColors.white)),
          ),
        ));
  }

  Widget lockedTextContainer(String text, bool isWithTwoRow) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: SizeUtil.smallValueHeight),
        width: SizeUtil.largeValueWidth,
        height: isWithTwoRow
            ? SizeUtil.normalValueHeight
            : SizeUtil.mediumValueHeight,
        color: AppColors.transparent,
        child: Text(
          text,
          style: isWithTwoRow == true
              ? AppTextStyles.aboutMeTextStyle(false)
                  .copyWith(color: AppColors.white)
              : AppTextStyles.heading(false).copyWith(
                  color: AppColors.white,
                ),
          textAlign: TextAlign.center,
        ));
  }
}
