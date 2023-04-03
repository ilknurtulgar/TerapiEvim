import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/profil/t_dealing_method_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class TDealingMethod extends StatelessWidget {
  const TDealingMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<TDealingMethodController>(
      getController: TDealingMethodController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
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
        )),
      ),
    );
  }
}
