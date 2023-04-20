import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';

import '../../../controller/therapist/profil/t_dealing_method_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
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
          appBar: MyAppBar(
            title: TherapistProfileTextUtil.dealingMetods,
          ),
          body: ListView.builder(
            itemCount: controller.listOfCopingMethods.length,
            itemBuilder: (context, index) => Padding(
              padding: AppPaddings.pagePaddingHorizontal,
              child: HomeComponent(
                isForMethodReading: true,
                time: controller.listOfCopingMethods.getTimes[index],
                title: controller.listOfCopingMethods.getMethodTitles[index],
                cardModel: controller.listOfCopingMethods.getTherapist,
                explanation:
                    controller.listOfCopingMethods.getExplanations[index],
                buttonOnTap: () {},
                buttonText: TherapistProfileTextUtil.view,
              ),
            ),
          )),
    );
  }
}
