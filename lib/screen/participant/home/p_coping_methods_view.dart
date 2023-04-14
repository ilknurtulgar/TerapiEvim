import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';

import '../../../controller/participant/coping_method/p_coping_method_controller.dart';
import '../../../core/base/component/activtiy/drop_down.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';

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
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        sizedBox(),
                      ],
                    ),
                    Positioned(right: 20, child: _orderdrop(controller)),
                  ],
                ),
              ),
              CopingListView(),
            ]),
          );
        });
  }

  CustomDropDown _orderdrop(PCopingMethodsController controller) {
    return CustomDropDown(
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

class CopingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPaddings.pagePadding,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return HomeComponent(
                isForMethodReading: true,
                cardModel: DemoInformation.cardModelhome,
                time: DemoInformation.clockabomeactivty,
                title: 'başlık $index',
                explanation: DemoInformation.home[index],
                buttonOnTap: () {},
                buttonText: HomeTextUtil.readMethod);
          },
          childCount: DemoInformation.home.length,
        ),
      ),
    );
  }
}
