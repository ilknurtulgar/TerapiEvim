// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../controller/therapist/profil/t_attended_seminar_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../product/widget/common/order_drop_down.dart';

// ignore: must_be_immutable
class TAttendedSeminarsView extends StatelessWidget {
  const TAttendedSeminarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TAttendedSeminarsController>(
      getController: TAttendedSeminarsController(),
      onModelReady: (mode) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(
          title: ParticipantProfileTextUtil.attendedSeminar,
        ),
        body: CustomScrollView(
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
                  child: DemoInformation.demoAttendedSeminars,
                ),
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _orderdropdown(TAttendedSeminarsController controller) {
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
