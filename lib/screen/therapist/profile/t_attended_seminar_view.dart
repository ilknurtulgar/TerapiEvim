// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/container/two_row_short_container.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';

import '../../../controller/therapist/profil/t_attended_seminar_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';

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
          body: ListView.builder(
            itemCount: controller.listOfActivities.length,
            itemBuilder: (context, index) => Padding(
              padding: AppPaddings.pagePaddingHorizontal,
              child: TwoRowShortContainer(
                row1Text: controller.listOfActivities.getTherapistNames[index],
                row2Text: controller.listOfActivities.getTitles[index],
                firstIconData: IconUtility.personIcon.icon!,
                secondIconData: IconUtility.windowsIcon.icon!,
                purpose: ContainerPurpose.seminar,
                firstOnTap: () {},
              ),
            ),
          )),
    );
  }
}
