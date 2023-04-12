import 'package:flutter/material.dart';
import '../../../controller/participant/profil/p_attended_seminars_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/component/activtiy/drop_down.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class PAttendedSeminarsView extends StatelessWidget {
  const PAttendedSeminarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PAttendedSeminarsController>(
      getController: PAttendedSeminarsController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: ParticipantProfileTextUtil.attendedSeminar),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppPaddings.pagePaddingHorizontal,
              sliver: SliverToBoxAdapter(child: _orderdropdown(controller)),
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

Widget _orderdropdown(PAttendedSeminarsController controller) {
  return CustomDropDown(
    selectedText: controller.orderValue,
    textList: DemoInformation.orderingList,
    isBoxSelected: controller.isBoxSelected,
    onDropDownTapped: () {
      controller.setIsBoxSelected();
    },
    onValueSelected: (int index) {
      print('index:${index}');
    },
    height: SizeUtil.smallValueHeight,
    width: SizeUtil.normalValueWidth,
  );
}
