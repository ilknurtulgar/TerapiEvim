import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/group/p_determining_short_call_time.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';

import '../../../../../core/base/component/group/choosing_time_sc_cont.dart';
import '../../../../../core/base/component/group/custom_heading.dart';
import '../../../../../core/base/util/base_model.dart';
import '../../../../../core/base/util/text_utility.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../model/therapist/session/free_date/t_free_date_model.dart';

class PShortCallTimeView extends StatelessWidget {
  const PShortCallTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PDeterminingShortCallController>(
      getController: PDeterminingShortCallController(),
      onModelReady: (controller) => controller.setContext(context),
      onPageBuilder: (context, controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RowView(
                    rowModel:
                        UiBaseModel.determiningappBar(context, controller),
                    padding: AppPaddings.appBarPadding),
                line(),
                CustomHeading(
                  text: "Merhaba ${controller.participantName}",
                  isalignmentstart: false,
                ),
                const PurpleTextContainer(
                    text: GroupTextUtil.shortCallDateChooseText),
                timeChoose(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider line() {
    return const Divider(
      color: AppColors.black,
      indent: 10,
      endIndent: 10,
      height: 0.1,
    );
  }

  Widget timeChoose(PDeterminingShortCallController controller) {
    return Obx(
      () => controller.freeDates.isEmpty
          ? EmptySizedBoxText()
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.freeDates.length,
              itemBuilder: (context, index) {
                final TFreeDateModel freeDate = controller.freeDates[index];

                if (freeDate.hours.isEmpty) return SizedBox();

                return Padding(
                  padding: AppPaddings.timeChossingBetweenPadding,
                  child: ChoosingTimeForSCContainer(
                    onSelectedHour: (int selectedHourIndex) => controller
                        .onSelectedHour(freeDate.hours[selectedHourIndex]),
                    therapistName: freeDate.therapistName,
                    isForParticipant: true,
                    date: freeDate.dateTime ?? Timestamp.now(),
                    timeList: freeDate.hours,
                    listViewChosenList: controller.isChosen,
                    dateIndex: index,
                  ),
                );
              },
            ),
    );
  }
}

IconButton saveButton(
    BuildContext context, PDeterminingShortCallController controller) {
  return IconButton(
    icon: IconUtility.save,
    onPressed: () {
      saveShowDialog(context, controller);
    },
  );
}

Future<String?> saveShowDialog(
    BuildContext context, PDeterminingShortCallController controller) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(GroupTextUtil.shortCallSaveText),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: Text(GroupTextUtil.cancelText),
        ),
        TextButton(
          onPressed: () {
            controller.saveButton();
            Get.back();
          },
          child: Text(GroupTextUtil.yes),
        ),
      ],
    ),
  );
}
