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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              headingtext(true, true, "TerapiEvim"),
              headingtext(false, false, "Hoşgeldiniz"),
              mindetailesbox("15 DAKİKALIK SEANSLARIM",
                  () => Get.to(const SessionScreen())),
              //paddig yok
              reminderactivity(),

              //notficationcontainer padding yok
              notificationcontainer()
            ],
          ),
        ),
      ),
    );
  }

  Padding notificationcontainer() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 11, top: 8),
      child: NotificationContainer(
        type: NotificationType.shortcallFail,
        contentText: "Simay Selli gönderdiğiniz isteği kabul etmedi.",
        name: "OKB grubu 2",
      ),
    );
  }

  Padding reminderactivity() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Reminder(
        reminderType: ReminderType.activity,
        name: "Yasemin",
        time: "14.44",
      ),
    );
  }
}
