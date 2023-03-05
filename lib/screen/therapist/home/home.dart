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
          child: Center(
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
      ),
    );
  }

  Padding notificationcontainer() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: NotificationContainer(
        type: NotificationType.shortcallFail,
        contentText: DemoInformation.notificationcontenttext,
        name: DemoInformation.groupname,
      ),
    );
  }

  Padding reminderactivity() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Reminder(
        reminderType: ReminderType.activity,
        name: DemoInformation.name,
        time: DemoInformation.clockabomeactivty,
      ),
    );
  }
}

class Responsive {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 390);
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 844);
  }

  static padding(double p, BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  static safepadding(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100) -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  static paddingtop(double p, BuildContext context) {
    return MediaQuery.of(context).padding.top * (p / 100);
  }
}
