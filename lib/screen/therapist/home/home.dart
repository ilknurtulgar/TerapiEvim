import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/reminder.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/home/home.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';

import '../../../core/base/component/home/notification_container.dart';

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

  Widget notificationcontainer() {
    return const NotificationContainer(
      type: NotificationType.shortcallFail,
      contentText: DemoInformation.notificationcontenttext,
      name: DemoInformation.groupname,
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
