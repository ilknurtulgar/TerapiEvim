import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';
import 'package:terapievim/core/base/ui_models/card_model.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';

import '../../../controller/therapist/profil/t_dealing_method_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/order_drop_down.dart';

// ignore: must_be_immutable
class TDealingMethodView extends StatelessWidget {
  const TDealingMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TDealingMethodController>(
      getController: TDealingMethodController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(
          title: TherapistProfileTextUtil.dealingMetods,
        ),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppPaddings.pagePaddingHorizontal,
              sliver: SliverToBoxAdapter(
                child: _orderdropdown(controller),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: AppPaddings.pagePaddingHorizontal,
                  child: HomeComponent(
                    isForMethodReading: true,
                    time: controller.listOfCopingMethods.getTimes[index],
                    title: controller.listOfCopingMethods.getMethodTitles[index],
                    cardModel: controller.listOfCopingMethods.getTherapist,
                    explanation: controller.listOfCopingMethods.getExplanations[index],
                    buttonOnTap: () {},
                    buttonText: TherapistProfileTextUtil.view,
                  ),
                ),
                childCount: controller.listOfCopingMethods.length,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

Widget _orderdropdown(TDealingMethodController controller) {
  return OrderDropDown(
    selectedText: controller.orderValue,
    isBoxSelected: controller.isBoxSelected,
    onDropDownTapped: () {
      controller.setIsBoxSelected();
    },
    onValueSelected: (int index) {
      print('index:${index}');
    },
  );
}
