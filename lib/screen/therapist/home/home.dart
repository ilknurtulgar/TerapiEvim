import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/reminder.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/home/home.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';

class TherapistHome extends StatelessWidget {
  const TherapistHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headingtext(true, true, GroupTextUtil.terapiEvim),
              headingtext(false, false, HomeTextUtil.welcome),
              mindetailesbox(HomeTextUtil.myMinuteSessions,
                  () => context.push(const SessionScreen()), context),
              reminderactivity(),
              const Padding(
                padding: AppPaddings.componentPadding,
                child: Reminder(
                  reminderType: ReminderType.activity,
                  name: DemoInformation.name,
                  time: DemoInformation.clockabomeactivty,
                ),
              ),
              notificationcontainer()
            ],
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

  Widget reminderactivity() {
    return const Reminder(
      reminderType: ReminderType.activity,
      name: DemoInformation.name,
      time: DemoInformation.clockabomeactivty,
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
}
