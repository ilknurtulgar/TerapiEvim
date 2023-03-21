import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/controller/test_questions_controller.dart';

import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return PagesForSCL(questions: DemoInformation.questions);
  }
}

//daha duzenlenecek
class PagesForSCL extends StatelessWidget {
  PagesForSCL({
    super.key,
    required this.questions,
  });
  final TestController _controller = Get.put(TestController());
  final List<Widget> questions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.appBarPadding,
        child: Obx(
          () => Column(
            children: [
              CustomHeading(
                text: GroupTextUtil.testHeading,
                isalignmentstart: false,
              ),
              _controller.testPageIndex.value == 0
                  ? const PurpleTextContainer(
                      text: GroupTextUtil.testDefinition)
                  : const SizedBox.shrink(),
              questionsWidget(),
              pageChangeButtons(),
            ],
          ),
        ),
      ),
    );
  }

  ListView questionsWidget() {
    return ListView.builder(
      itemBuilder: (context, index) =>
          questions[index + _controller.testPageIndex.value * 3],
      itemCount: 3, //sayfada kac soru olacak sor
      shrinkWrap: true,
      padding: AppPaddings.componentPadding,
    );
  }

  Row pageChangeButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
            textColor: Colors.white,
            container: AppContainers.purpleButtonContainer(null),
            onTap: _controller.previousPage,
            text: GroupTextUtil.previousPage),
        CustomButton(
            textColor: Colors.white,
            container: AppContainers.purpleButtonContainer(null),
            onTap: _controller.nextPage,
            text: GroupTextUtil.nextPage),
      ],
    );
  }
}
