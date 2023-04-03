import 'package:flutter/material.dart';
import 'package:terapievim/controller/participant/profil/p_attended_seminars_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class AttendedSeminars extends StatelessWidget {
  const AttendedSeminars({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseView<AttendedSeminarsController>(
      getController: AttendedSeminarsController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueChalk,
          title: Text(
            ParticipantProfileTextUtil.attendedSeminar,
            style: AppTextStyles.heading(false),

          ),
        ),
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
