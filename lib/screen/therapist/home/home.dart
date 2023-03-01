import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/home/notification_container.dart';

import 'package:terapievim/core/base/component/home/reminder.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
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
              headingtext(true, true, GroupTextUtil.terapiEvim),
              headingtext(false, false, HomeTextUtil.welcome),
              mindetailesbox(HomeTextUtil.myMinuteSessions,
                  () => Get.to(const SessionScreen())),
              reminderactivity(),
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
        contentText: DemoInformation.notificationcontenttext,
        name: DemoInformation.groupname,
      ),
    );
  }

  Padding reminderactivity() {
    return const Padding(
      padding: AppPaddings.generalPadding,
      child: Reminder(
        reminderType: ReminderType.activity,
        name: DemoInformation.name,
        time: DemoInformation.clockabomeactivty,
      ),
    );
  }
}
