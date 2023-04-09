import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';

import '../../../controller/participant/coping_method/p_coping_method_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/home/method_downloading_container.dart';
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
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: AppPaddings.pagePadding,
                      child: Column(
                        children: [sizedBox(), CopingListView()],
                      ),
                    ),
                    Positioned(right: 24, child: _orderdrop(controller)),
                  ],
                ),
              ),
            ),
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
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MethodDownloadingContainer(
            cardModel: DemoInformation.cardModelhome,
            time: DemoInformation.clockabomeactivty,
            explanation: DemoInformation.home[index],
            buttonOnTap: () {},
            buttonText: HomeTextUtil.readMethod);
      },
      itemCount: DemoInformation.home.length,
    );
  }
}
