import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';

import '../group/participant_ui/scl90/questions_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  GroupController groupController = Get.put(GroupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            togglebuttonsview(),
          ],
        ),
      ),
    );
  }

  Container togglebuttonsview() {
    return Container(
      decoration: AppBoxDecoration.lockScreenBox,
      width: 341,
      child: Column(children: [
        CustomHeading(
            isToggle: true,
            text:
                "1.Yasemini insanlar 100 üzerinden  ne kadar severlerse yasemin ne kadar mutlu olur?(Cevap yok hehe)"),
        ToggleQuestions(),
      ]),
    );
  }
}

List toggletext = ["hiç", "çok az", "orta", "fazla", "aşırı"];
