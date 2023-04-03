// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../controller/therapist/profil/t_attended_seminar_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';

// ignore: must_be_immutable
class TAttendedSeminars extends StatelessWidget {
  const TAttendedSeminars({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TAttendedSeminarsController>(
      getController: TAttendedSeminarsController(),
      onModelReady: (mode) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.blueChalk,
            title: Text(ParticipantProfileTextUtil.attendedSeminar,
                style: AppTextStyles.heading(false))),
        body: CustomScrollView(
          slivers: [
            // SliverPadding(
            //   padding: AppPaddings.pagePaddingHorizontal,
            //   sliver: SliverToBoxAdapter(
            //     child: orderdropdown(),
            //   ),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: AppPaddings.pagePaddingHorizontal,
                  child: DemoInformation.demoAttendedSeminars,
                ),
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
