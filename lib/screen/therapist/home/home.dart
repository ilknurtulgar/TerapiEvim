import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/home/notification_container.dart';

import 'package:terapievim/core/base/component/home/reminder.dart';
import 'package:terapievim/screen/participant/home/home.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';

class TherapistHome extends StatelessWidget {
  const TherapistHome({super.key});

  @override
  Widget build(BuildContext context) {
    //deneme icin
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              headingtext(true, true, "TerapiEvim"),
              headingtext(false, false, "Hoşgeldiniz"),
              mindetailesbox("15 DAKİKALIK SEANSLARIM",
                  () => Get.to(const SessionScreen())),
              const Center(
                  child: Reminder(
                reminderType: ReminderType.activity,
                name: "Yasemin",
                time: "14.44",
              )),
              const SizedBox(
                height: 40,
              ),
              const NotificationContainer(
                type: NotificationType.shortcallFail,
                contentText: "Simay Selli gönderdiğiniz isteği kabul etmedi.",
                name: "OKB grubu 2",
              )
            ],
          ),
        ),
      ),
    );
  }

  Column denemey() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
            child: Reminder(
          reminderType: ReminderType.activity,
          name: "Yasemin",
          time: "14.44",
        )),
        SizedBox(
          height: 40,
        ),
        NotificationContainer(
          type: NotificationType.shortcallFail,
          contentText: "Simay Selli gönderdiğiniz isteği kabul etmedi.",
          name: "OKB grubu 2",
        )
      ],
    );
  }
}
