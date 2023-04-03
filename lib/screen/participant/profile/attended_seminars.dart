import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/profil/p_attended_seminars_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class AttendedSeminars extends StatelessWidget {
  AttendedSeminars({super.key});
  AttendedSeminarsController controller = Get.put(AttendedSeminarsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueChalk,
        title: Text(
          ParticipantProfileTextUtil.attendedSeminar,
          style: AppTextStyles.heading(false),
        ),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: AppPaddings.pagePaddingHorizontal,
            sliver: SliverToBoxAdapter(child: SizedBox() // orderdropdown(),
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
