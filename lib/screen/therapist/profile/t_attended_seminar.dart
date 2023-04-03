// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';

import '../../../controller/therapist/profil/t_attended_seminar_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';

// ignore: must_be_immutable
class TAttendedSeminars extends StatelessWidget {
  TAttendedSeminars({super.key});
  TAttendedSeminarsController controller =
      Get.put(TAttendedSeminarsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.blueChalk,
          title: Text(ParticipantProfileTextUtil.attendedSeminar,
              style: AppTextStyles.heading(false))),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: AppPaddings.pagePaddingHorizontal,
            sliver: SliverToBoxAdapter(child: SizedBox() //orderdropdown(),
                ),
          ),
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
      )),
    );
  }
}
