import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/purple_border_text_ccontainer.dart';
import 'package:terapievim/core/base/component/group/questions_button.dart';
import 'package:terapievim/screen/participant/group/scl90/test_questions_controller.dart';

import '../../../../core/base/util/base_utility.dart';

class Test extends StatelessWidget {
  Test({super.key});

  List<Widget> questions = [
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview()
  ];
  @override
  Widget build(BuildContext context) {
    return PagesForSCL(questions: questions);
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

  final String heading = "Psikolojik Tarama Testi";
  final String definition =
      "Kendine en uygun grubu bulabilmesi ve en efektif yardimi alabilmesi adina psikolojik test olan   testini ve 15 dakikalık terapist görüşmesi ölçeklerini kullanarak grup kategorileriniz açılmaktadır. ";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Obx(
        () => Column(
          children: [
            CustomHeading(
              text: heading,
              isalignmentstart: false,
              padding: const EdgeInsets.symmetric(vertical: 32),
            ),
            _controller.testPageIndex.value == 0
                ? PurpleBorderWhiteInsideTextContainer(text: definition)
                : const SizedBox.shrink(),
            ListView.builder(
              itemBuilder: (context, index) =>
                  questions[index + _controller.testPageIndex.value * 3],
              itemCount: 3, //sayfada kac soru olacak sor
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 23),
            ),
            pageChangeButtons()
          ],
        ),
      ),
    );
  }

  Row pageChangeButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
            container: AppContainers.purpleButtonContainer(null),
            onTap: _controller.previousPage,
            text: "Onceki Sayfa"),
        CustomButton(
            container: AppContainers.purpleButtonContainer(null),
            onTap: _controller.nextPage,
            text: "Sonraki Sayfa"),
      ],
    );
  }
}
