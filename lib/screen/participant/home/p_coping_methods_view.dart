import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';

import '../../../controller/participant/coping_method/p_coping_method_controller.dart';
import '../../../core/base/component/activtiy/drop_down.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';

class PCopingMethodsView extends StatelessWidget {
  const PCopingMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PCopingMethodsController>(
        getController: PCopingMethodsController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(title: HomeTextUtil.copingMethods),
            body: CustomScrollView(slivers: [
              SliverPadding(
                padding: AppPaddings.pagePadding,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final TCopingMethodModel? copingMethodModel =
                          controller.fetchedCoping[index];
                      return HomeComponent(
                          isForMethodReading: true,
                          cardModel: DemoInformation.cardModelhome,
                          time: (copingMethodModel?.dateTime ?? Timestamp.now())
                              as String,
                          title: copingMethodModel?.therapistName ?? "",
                          explanation: copingMethodModel?.description ?? "",
                          buttonOnTap: () {},
                          buttonText: HomeTextUtil.readMethod);
                    },
                    childCount: controller.fetchedCoping.length,
                  ),
                ),
              ),
            ]),
          );
        });
  }

  CustomDropDown _orderdrop(PCopingMethodsController controller) {
    return CustomDropDown(
      isLogin: false,
      width: SizeUtil.normalValueWidth,
      height: SizeUtil.smallValueHeight,
      selectedText: controller.orderValue,
      textList: DemoInformation.orderingList,
      isBoxSelected: controller.isBoxSelected,
      onDropDownTapped: () {
        controller.setIsBoxSelected();
      },
      onValueSelected: (p0) {},
    );
  }
}
