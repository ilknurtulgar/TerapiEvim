import 'package:flutter/material.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';

import '../../../controller/therapist/home/t_home_view_controller.dart';
import '../../../core/base/component/home/notification_container.dart';
import '../../../core/base/component/home/reminder.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../participant/home/p_home_view.dart';
import 't_session_view.dart';

class THomeView extends StatelessWidget {
  THomeView({
    super.key,
  });
  final bool isService = true;
  @override
  Widget build(BuildContext context) {
    return BaseView<THomeViewController>(
      getController: THomeViewController(),
      onPageBuilder: (context, THomeViewController controller) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                headingText(true, true, GroupTextUtil.terapiEvim),
                headingText(false, false, HomeTextUtil.welcome),
                minDetailsBox(HomeTextUtil.myMinuteSessions,
                    () => context.push(const TSessionView()), context),
                isService == false ? EmptySizedBoxText() : reminderactivity(),
                notificationcontainer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationcontainer() {
    return NotificationContainer(
      type: NotificationType.shortcallFail,
      contentText: DemoInformation.notificationcontenttext,
      name: DemoInformation.groupname,
      onTap: () {
        print("ooo");
      },
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
