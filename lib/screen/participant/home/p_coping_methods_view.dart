import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';

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
              SliverPadding(
                padding: AppPaddings.pagePadding,
                sliver:
                    // controller.fetchedCoping.isEmpty
                    //  ? SliverToBoxAdapter(child: EmptySizedBoxText())
                    SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      /*   final TCopingMethodModel? copingMethodModel =
                            controller.fetchedCoping[index];*/
                      return HomeComponent(
                          isForMethodReading: true,
                          cardModel: DemoInformation.cardModelhome,
                          time:
                              //copingMethodModel?.dateTime ??
                              dateTimes[index],
                          title:
                              // copingMethodModel?.therapistName ??
                              "",
                          explanation:
                              // copingMethodModel?.description ??
                              explantaionList[index],
                          buttonOnTap: () {
                            flutterErrorToast(
                                "Baş etme metotu bulunmamaktadır");
                          },
                          buttonText: HomeTextUtil.readMethod);
                    },
                    childCount: 3,
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

List<String> dateTimes = ["11.02.23", "10.22.22", "11.15.23", "05.08.22"];
List<String> explantaionList = [
  "Baş etme metotunu incelemeyi unutmayınız",
  "Stres ile ilgili metotu incelemenizi öneririm",
  "Nefes egzersizlerini yapmanızı tavsiye ederim",
  "Stres yazısnı okumanızı öneririm"
];
