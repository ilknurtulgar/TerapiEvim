import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';

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
              activityseminar(),
              activityminto("Yaklaşan Diğer Aktiviteler", () => () {}),
              activityseminar(),
              activityminto("Geçmiş Aktivitelerim", () => () {}),
              activityseminar(),
              activityminto("Geçmiş Diğer Aktiviteler", () => () {}),
              activityseminar(),
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
                Get.to(const NewActivityScreen());
              },
              icon: const Icon(
                Icons.add_circle_outline,
              )),
        )
      ],
    );
  }
}
