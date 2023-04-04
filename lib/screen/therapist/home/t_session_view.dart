import 'package:flutter/material.dart';

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
            body: SingleChildScrollView(
              child: Stack(children: [
                Padding(
                  padding: AppPaddings.pagePadding,
                  child: Column(
                    children: [
                      doubleappbar(
                        HomeTextUtil.myMinuteSessions,
                        backButton(context, () => context.pop()),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              context.push(const TAvailableHoursView());
                            },
                            icon: IconUtility.clockIcon),
                      ),
                      sizedbox(),
                      _aboutparticipant(),
                    ],
                  ),
                ),
                Positioned(
                    top: 90, right: 24, child: _orderdropdown(controller)),
              ]),
            ),
          );
        });
  }

  ListView _aboutparticipant() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return participantWihtShortCallTime(
            DemoInformation.copingList[index], DemoInformation.date);
      },
      itemCount: DemoInformation.copingList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

Widget _orderdropdown(TSessionController controller) {
  return CustomDropDown(
    selectedText: controller.orderValue,
    textList: DemoInformation.orderingList,
    isBoxSelected: controller.isBoxSelected,
    onDropDownTapped: () {
      controller.setIsBoxSelected();
    },
    height: SizeUtil.smallValueHeight,
    width: SizeUtil.normalValueWidth,
  );
}
