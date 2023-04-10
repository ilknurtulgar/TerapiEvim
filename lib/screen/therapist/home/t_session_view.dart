import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';

import '../../../controller/therapist/home/session/t_session_controller.dart';
import '../../../core/base/component/activtiy/drop_down.dart';
import '../../../core/base/component/home/participant_with_sc_time.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import 't_available_hours_view.dart';

class TSessionView extends StatelessWidget {
  const TSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TSessionController>(
        getController: TSessionController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(title: HomeTextUtil.myMinuteSessions, actions: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.push(const TAvailableHoursView());
                  },
                  icon: IconUtility.clockIcon),
            ]),
            body: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Stack(children: [
                  Column(
                    children: [
                      sizedBox(),
                    ],
                  ),
                  Positioned(right: 24, child: _orderdropdown(controller)),
                ]),
              ),
              _aboutparticipant(),
            ]),
          );
        });
  }

  Widget _aboutparticipant() {
    return SliverPadding(
      padding: AppPaddings.pagePadding,
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: DemoInformation.copingList.length,
              (context, index) => participantWithShortCallTime(
                  DemoInformation.copingList[index], DemoInformation.date))),
    );
  }

  Widget _orderdropdown(TSessionController controller) {
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
}
