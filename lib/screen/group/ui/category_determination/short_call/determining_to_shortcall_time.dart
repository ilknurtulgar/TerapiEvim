import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/component/choosing_time_for_short_call_container.dart';
import 'package:terapievim/screen/group/component/purple_border_text_ccontainer.dart';

import '../../../component/heading.dart';
import '../../../util/lockScreenutility.dart';

class ShortCallTime extends StatelessWidget {
  ShortCallTime({super.key});
  String therapistName = "Yasemin Bebek";
  String datetime = "27.01.2023";
  List<String> timelist = ["12.00", "15.00", "20.00"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(),
            Divider(
              color: AppColors.black,
            ),
            Heading(
              headingText: "Merhaba Yasemincim",
            ),
            PurpleBorderWhiteInsideTextContainer(
                text: "Size Uyhun Tarih ve Saat Seciniz."),
            SizedBox(
              height: 26,
            ),
            TimeChoose(),
            TimeChoose(),
            TimeChoose(),
          ],
        ),
      ),
    );
  }

  Padding CustomAppBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 20,
          ),
          Heading(
            headingText: "TerapiEvim",
            padding: EdgeInsets.all(10),
          ),
          IconButton(
            icon: IconUtility.save,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Padding TimeChoose() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ChoosingTimeForSCContainer(
          therapistName: therapistName, date: datetime, timeList: timelist),
    );
  }
}
