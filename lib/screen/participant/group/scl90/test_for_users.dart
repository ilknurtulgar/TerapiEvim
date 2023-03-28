import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/controller/test_questions_controller.dart';
import 'package:terapievim/core/base/component/group/questions_button.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/group/scl90/lock_screen.dart';

import '../../../../controller/main_controller.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return PagesForSCL();
  }
}

//daha duzenlenecek
class PagesForSCL extends StatelessWidget {
  PagesForSCL({
    super.key,
  });
  final TestController _controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.appBarPadding,
        child: Obx(
          () => Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                const CustomHeading(
                  text: GroupTextUtil.testHeading,
                  isalignmentstart: false,
                ),
                _controller.testPageIndex.value == 0
                    ? const PurpleTextContainer(
                        text: GroupTextUtil.testDefinition)
                    : const SizedBox.shrink(),
                questionsWidget(),
                pageChangeButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView questionsWidget() {
    const List<String> questions = Scl90.questions;
    return ListView.builder(
      itemBuilder: (context, index) => ToggleQuestions(
          question: questions[index + _controller.getQuestionIndex()]),
      itemCount: 9, //sayfada kac soru olacak sor
      shrinkWrap: true,
      padding: AppPaddings.componentPadding,
    );
  }

  Widget pageChangeButtons(BuildContext context) {
    late Widget shown;
    if (_controller.getTestPageIndex() == 9) {
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
            context.push(const LockScreen());
          },
          text: Scl90.finish);
    } else {
      shown = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _controller.getTestPageIndex() != 0
              ? CustomButton(
                  textColor: Colors.white,
                  container: AppContainers.purpleButtonContainer(
                      SizeUtil.smallValueWidth),
                  onTap: _controller.previousPage,
                  text: GroupTextUtil.previousPage)
              : const SizedBox.shrink(),
          CustomButton(
              textColor: Colors.white,
              container:
                  AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
              onTap: _controller.nextPage,
              text: GroupTextUtil.nextPage),
        ],
      );
    }
    return shown;
  }
}
