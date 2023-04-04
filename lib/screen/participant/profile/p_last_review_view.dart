import 'package:flutter/material.dart';
import '../../../controller/participant/profil/p_last_review_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class PLastReviewView extends StatelessWidget {
  const PLastReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PLastReviewController>(
        getController: PLastReviewController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
              appBar:
                  const MyAppBar(title: ParticipantProfileTextUtil.lastReview),
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
