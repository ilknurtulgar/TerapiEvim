import 'package:flutter/material.dart';

import '../../../controller/therapist/profil/t_dealing_method_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';

// ignore: must_be_immutable
class TDealingMethodView extends StatelessWidget {
  const TDealingMethodView({super.key});

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
