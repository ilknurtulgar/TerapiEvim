import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';

import '../../../core/base/component/group/group_box.dart';

class TherapistActivityScreen extends StatelessWidget {
  const TherapistActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              activityappbar(),
              activityminto("Yaklaşan Aktivitelerim", () => () {}),
              ActivityBox(
                  istwobutton: true,
                  buttonText: "Başla",
                  containerModel: AppContainers.containerButton(true),
                  isactivity: true,
                  arowModel: DemoInformation.arowmodel,
                  clockModel: DemoInformation.clockmodel),
              activityminto("Yaklaşan Diğer Aktiviteler", () => () {}),
              ActivityBox(
                  istwobutton: false,
                  buttonText: "Katıl",
                  containerModel: AppContainers.containerButton(false),
                  isactivity: false,
                  arowModel: DemoInformation.arowmodel,
                  ayrowwModel: DemoInformation.ayrowmodel,
                  clockModel: DemoInformation.clockmodel),
              activityminto("Geçmiş Aktivitelerim", () => () {}),
              ActivityBox(
                  istwobutton: false,
                  buttonText: "Kaydı İzle",
                  containerModel: AppContainers.containerButton(true),
                  isactivity: true,
                  arowModel: DemoInformation.arowmodel,
                  clockModel: DemoInformation.clockmodel),
              activityminto("Geçmiş Diğer Aktiviteler", () => () {}),
              ActivityBox(
                  istwobutton: false,
                  buttonText: "Katıl",
                  containerModel: AppContainers.containerButton(false),
                  isactivity: false,
                  arowModel: DemoInformation.arowmodel,
                  ayrowwModel: DemoInformation.ayrowmodel,
                  clockModel: DemoInformation.clockmodel),
              sizedbox()
            ],
          ),
        ),
      ),
    );
  }

  Row activityappbar() {
    return Row(
      children: [
        search(searchModel),
        Align(
          alignment: Alignment.center,
          child: IconButton(
              onPressed: () {
                therapistActivtyController.updatechnage(1);
                Get.to(const NewActivityScreen());
              },
              icon: IconUtility.addIcon),
        )
      ],
    );
  }
}
