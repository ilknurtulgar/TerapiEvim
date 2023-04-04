import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/group/category_determination/group_categories/p_group_categories_view.dart';

import '../../../../screen/participant/group/scl90/p_test_for_users_view.dart';
import '../../util/text_utility.dart';
import '../buttons/custom_button.dart';
import '../../util/base_utility.dart';
import '../../../../controller/main_controller.dart';

class PopUp extends StatelessWidget {
  const PopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    Widget shown = controller.isTestNotSolved.isTrue
        ? noTest(context)
        : controller.isTestResultReady.isTrue
            ? checkedTest(context)
            : uncheckedTest();
    Icon lockicon = controller.isTestResultReady.isTrue
        ? IconUtility.lockopen
        : IconUtility.lock(true);
    return BackdropFilter(
      filter: Filter.blur,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [lockicon, shown]),
    );
  }
}

Column checkedTest(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      lockedTextContainer(GroupTextUtil.lockScreencheckedTestString),
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
      lockedTextContainer(GroupTextUtil.lockScreenText),
    ],
  );
}

Column noTest(BuildContext context) {
  return Column(
    children: [
      lockedTextContainer(GroupTextUtil.lockScreenText),
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
        margin: const EdgeInsets.symmetric(vertical: SizeUtil.smallValueHeight),
        width: SizeUtil.largeValueWidth,
        height: SizeUtil.smallValueHeight,
        decoration: AppBoxDecoration.lockScreenButton,
        child: Center(
          child: Text(GroupTextUtil.lockScreenbuttonText,
              style: AppTextStyles.buttonTextStyle(AppColors.white)),
        ),
      ));
}

Widget lockedTextContainer(String text) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: SizeUtil.smallValueHeight),
      width: SizeUtil.largeValueWidth,
      height: SizeUtil.mediumValueHeight,
      color: AppColors.transparent,
      child: Text(
        text,
        style: AppTextStyles.heading(false).copyWith(
          color: AppColors.white,
        ),
        textAlign: TextAlign.center,
      ));
}
