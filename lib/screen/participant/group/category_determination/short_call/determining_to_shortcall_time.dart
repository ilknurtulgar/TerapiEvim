import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/group/choosing_time_sc_cont.dart';
import 'package:terapievim/core/base/component/group/purple_border_text_ccontainer.dart';
import 'package:terapievim/screen/participant/group/util/text_util.dart';

import '../../../../../core/base/component/group/custom_heading.dart';
import '../../util/group_screen_utility.dart';

// ignore: must_be_immutable
class ShortCallTime extends StatelessWidget {
  ShortCallTime({super.key});
  // gecici
  String therapistName = "Yasemin Bebek";
  String datetime = "27.01.2023";
  List<String> timelist = ["12.00", "15.00", "20.00"];
  String userName = "Yasemin";
  int tmpCount = 5;

  @override
  Widget build(BuildContext context) {
    String hiUser = "Merhaba $userName";
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
      itemCount: tmpCount,
      itemBuilder: (context, index) => Padding(
        padding: GroupPaddings.timeChossingBetweenPadding,
        child: ChoosingTimeForSCContainer(
          therapistName: therapistName,
          date: datetime,
          timeList: timelist,
          listviewIndex: index,
        ),
      ),
    );
  }
}
