import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/group/choosing_time_sc_cont.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/screen/participant/group/util/text_util.dart';

import '../../../../../core/base/component/group/custom_heading.dart';
import '../../util/group_screen_utility.dart';

class ShortCallTime extends StatelessWidget {
  const ShortCallTime({super.key});
  // gecici

  @override
  Widget build(BuildContext context) {
    String hiUser = "Merhaba ${DemoInformation.userName}";
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            rowView(
                RowModel(
                    text: GroupTexts.terapiEvim,
                    textStyle: AppTextStyles.heading(false),
                    isAlignmentBetween: true,
                    trailingIcon: saveButton()),
                GroupPaddings.appbarPadding),
            line(),
            CustomHeading(
              text: hiUser,
              isalignmentstart: false,
            ),
            const PurpleTextContainer(text: GroupTexts.shortCallDateChooseText),
            timeChoose(),
          ],
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

  IconButton saveButton() {
    return IconButton(
      icon: IconUtility.save,
      onPressed: () {},
    );
  }

  Widget timeChoose() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DemoInformation.tmpCount,
      itemBuilder: (context, index) => Padding(
        padding: GroupPaddings.timeChossingBetweenPadding,
        child: ChoosingTimeForSCContainer(
          therapistName: DemoInformation.therapistName,
          date: DemoInformation.datetime,
          timeList: DemoInformation.timelist,
          listviewIndex: index,
        ),
      ),
    );
  }
}
