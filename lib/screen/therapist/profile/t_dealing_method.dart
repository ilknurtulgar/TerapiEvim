import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/profil/last_review_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class TDealingMethod extends StatelessWidget {
  TDealingMethod({super.key});
  LastReviewController controller = Get.put(LastReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueChalk,
        title: Text(
          TherapistProfileTextUtil.dealingMetods,
          style: AppTextStyles.heading(false),
        ),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: AppPaddings.pagePaddingHorizontal,
            sliver: SliverToBoxAdapter(
              child: orderdropdown(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: AppPaddings.pagePaddingHorizontal,
                child: DemoInformation.demoLAstReviewContainer,
              ),
              childCount: 10,
            ),
          ),
        ],
      )),
    );
  }
}
