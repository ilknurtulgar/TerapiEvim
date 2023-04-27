// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/profile/container/two_row_short_container.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../controller/therapist/profil/t_attended_seminar_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../model/common/activity/t_activity_model.dart';

// ignore: must_be_immutable
class TAttendedSeminarsView extends StatelessWidget {
  const TAttendedSeminarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TAttendedSeminarsController>(
      getController: TAttendedSeminarsController(),
      onModelReady: (mode) {},
      onPageBuilder: (context, controller) => Scaffold(
          appBar: MyAppBar(
            title: ParticipantProfileTextUtil.attendedSeminar,
          ),
          body: Obx(
            () => ListView.builder(
                itemCount: controller.listOfActivities.length,
                itemBuilder: (context, index) {
                  TActivityModel activity = controller.listOfActivities[index];
                  return Padding(
                    padding: AppPaddings.pagePaddingHorizontal,
                    child: TwoRowShortContainer(
                      row1Text:
                          activity.therapistName ?? EmptyTextUtil.emptyText,
                      row2Text: activity.title ?? EmptyTextUtil.emptyText,
                      firstIconData: IconUtility.personIcon.icon!,
                      secondIconData: IconUtility.windowsIcon.icon!,
                      purpose: ContainerPurpose.seminar,
                      firstOnTap: () {
                        // to do: watch seminar function
                      },
                    ),
                  );
                }),
          )),
    );
  }
}
