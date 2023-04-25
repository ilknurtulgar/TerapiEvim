import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/managers/converter/date_time_manager.dart';
import 'package:terapievim/model/therapist/session/t_session_model.dart';

import '../../../controller/therapist/home/session/t_session_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/home/participant_with_sc_time.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import 'session/test_result_view.dart';
import 't_available_hours_view.dart';

class TSessionView extends StatelessWidget {
  const TSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TSessionController>(
        getController: TSessionController(),
        onModelReady: (controller) {
          controller.setContext(context);
        },
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(title: HomeTextUtil.myMinuteSessions, actions: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.push(TAvailableHoursView());
                  },
                  icon: IconUtility.clockIcon),
            ]),
            body: CustomScrollView(slivers: [
              _aboutParticipant(controller),
            ]),
          );
        });
  }

  Widget _aboutParticipant(TSessionController controller) {
    return SliverPadding(
      padding: AppPaddings.pagePadding,
      sliver: Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: controller.fetchedSession.length, (context, index) {
            final TSessionModel? sessionModel =
                controller.fetchedSession[index];

            return participantWithShortCallTime(
              participantName: sessionModel?.participantName ?? "",
              time: (DateTimeManager.getFormattedDateFromFormattedString(
                  value: sessionModel?.dateTime?.toDate().toIso8601String())),
              testResultOnTapped: () =>
                  context.push(TestResultView(session: sessionModel!)),
              joinOnTapped: () => controller.joinShortCall(sessionModel),
            );
          }),
        ),
      ),
    );
  }
}
