import 'package:flutter/material.dart';

import '../../../core/base/component/home/notification_container.dart';
import '../../../core/base/component/home/reminder.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../../../screen/participant/home/home.dart';
import '../../../screen/therapist/home/session_screen.dart';

class TherapistHome extends StatelessWidget {
  TherapistHome({
    super.key,
  });

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              headingtext(true, true, GroupTextUtil.terapiEvim),
              headingtext(false, false, HomeTextUtil.welcome),
              mindetailesbox(HomeTextUtil.myMinuteSessions,
                  () => context.push(const SessionScreen()), context),
              reminderactivity(),
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
