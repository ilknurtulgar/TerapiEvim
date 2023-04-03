import 'package:flutter/material.dart';
import 'package:terapievim/controller/participant/profil/last_review_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class LastReview extends StatelessWidget {
  const LastReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LastReviewController>(
        getController: LastReviewController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: AppColors.blueChalk,
                  title: Text(
                    ParticipantProfileTextUtil.lastReview,
                    style: AppTextStyles.heading(false),
                  )),
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
                        child: DemoInformation.demoLAstReviewContainer,
                      ),
                      childCount: 10,
                    ),
                  ),
                ],
              ));
        });
  }
}
