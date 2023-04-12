import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/group/p_test_questions_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/base/component/group/questions_button.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../../controller/main_controller.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import 'p_lock_view.dart';

class PTestView extends StatelessWidget {
  const PTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewsForSCL();
  }
}

//daha duzenlenecek
class ViewsForSCL extends StatelessWidget {
  ViewsForSCL({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<PTestQuestionsController>(
      getController: PTestQuestionsController(),
      onModelReady: (model) => model.setContext(context),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(
          title: GroupTextUtil.testHeading,
        ),
        body: SingleChildScrollView(
          padding: AppPaddings.appBarPadding,
          child: Obx(
            () => Padding(
              padding: AppPaddings.pagePadding,
              child: Column(
                children: [
                  controller.testPageIndex.value == 0
                      ? const PurpleTextContainer(
                          text: GroupTextUtil.testDefinition)
                      : const SizedBox.shrink(),
                  questionsWidget(controller),
                  pageChangeButtons(context, controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView questionsWidget(PTestQuestionsController controller) {
    const List<String> questions = Scl90.questions;
    return ListView.builder(
      itemBuilder: (context, index) {
        final questionIndex = index + controller.getTestPageIndex() * 9;
        print('questionIndex:${questionIndex}');
        return Obx(
          () => ToggleQuestions(
            children: choice,
            question: questions[questionIndex],
            isSelected: controller.list[questionIndex],
            onPressed: (val) {
              controller.selecttooggle(questionIndex, val!);
              controller.button(questionIndex, val);
            },
          ),
        );
      },
      itemCount: 9, //sayfada kac soru olacak sor
      shrinkWrap: true,
      padding: AppPaddings.componentPadding,
    );
  }

  Widget pageChangeButtons(
      BuildContext context, PTestQuestionsController controller) {
    late Widget shown;
    if (controller.getTestPageIndex() == 9) {
      shown = CustomButton(
          container:
              AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
          textColor: AppColors.white,
          onTap: () {
            MainController controller = Get.find();
            controller.testSolved();
            //burasi ni boyle yapmayinca duzgun calismiyor
            context.pop();
            context.pop();
            context.push(const PLockView());
          },
          text: Scl90.finish);
    } else {
      shown = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          controller.getTestPageIndex() != 0
              ? CustomButton(
                  textColor: Colors.white,
                  container: AppContainers.purpleButtonContainer(
                      SizeUtil.smallValueWidth),
                  onTap: controller.previousPage,
                  text: GroupTextUtil.previousPage)
              : const SizedBox.shrink(),
          CustomButton(
              textColor: Colors.white,
              container:
                  AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
              onTap: controller.nextPage,
              text: GroupTextUtil.nextPage),
        ],
      );
    }
    return shown;
  }
}

final List<Widget> choice = [
  IconUtility.checkCircleIcon,
  IconUtility.checkCircleIcon,
  IconUtility.checkCircleIcon,
  IconUtility.checkCircleIcon,
  IconUtility.checkCircleIcon
];

class QuestionsModel {
  final int index;
  final int point;
  final String text;

  QuestionsModel({
    required this.index,
    required this.point,
    required this.text,
  });
}
