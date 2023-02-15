import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/notification_container.dart';

import 'package:terapievim/core/base/component/home/reminder.dart';

class TherapistHome extends StatelessWidget {
  const TherapistHome({super.key});

  @override
  Widget build(BuildContext context) {
    //deneme icin
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
