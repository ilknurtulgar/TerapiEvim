import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/home/participant_with_sc_time.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../controller/therapist/session/t_session_controller.dart';
import '../../../core/base/view/base_view.dart';
import 'available_hours.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

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
                              context.push(const AvailableHours());
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
  return Obx(
    () => CustomDropDown(
      orderText: controller.orderValue,
      textList: DemoInformation.orderingList,
      isBoxSelected: controller.isBoxSelected.value,
      onDropDownTapped: () {
        controller.setIsBoxSelected();
      },
      // widget: textpurpose(controller.order.value),
      // widget: textpurpose(controller.sortController.text),
      height: SizeUtil.smallValueHeight,
      width: SizeUtil.normalValueWidth,
    ),
  );
}
