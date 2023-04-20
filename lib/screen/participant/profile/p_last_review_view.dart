import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';
import '../../../controller/participant/profil/p_last_review_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../product/widget/common/order_drop_down.dart';

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
                  SliverPadding(
                    padding: AppPaddings.pagePaddingHorizontal,
                    sliver:
                        SliverToBoxAdapter(child: _orderdropdown(controller)),
                  ),
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
                        child: HomeComponent(
                          isForMethodReading: true, 
                          cardModel: controller.listOfCopingMethods.getTherapist,
                          time: controller.listOfCopingMethods.getTimes[index],
                          title: controller.listOfCopingMethods.getMethodTitles[index],
                          explanation: controller.listOfCopingMethods.getExplanations[index],
                          buttonOnTap: (){

                          }, buttonText: ParticipantProfileTextUtil.readAgain),
                      ),
                      childCount: controller.listOfCopingMethods.length,
                    ),
                  ),
                ],
              ));
        });
  }
}

Widget _orderdropdown(PLastReviewController controller) {
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
