import 'package:flutter/material.dart';

import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import 't_add_hours_view.dart';

class TAvailableHoursView extends StatelessWidget {
  const TAvailableHoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              doubleappbar(
                  HomeTextUtil.myAvailableHours,
                  backButton(context, () {
                    context.pop();
                  }),
                  IconButton(
                      onPressed: () {
                        context.push(const TAddHoursView());
                      },
                      icon: IconUtility.addIcon)),
              choosingtime(),
            ],
          ),
        ),
      ),
    );
  }

  ListView choosingtime() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
            padding: AppPaddings.timeChossingBetweenPadding,
            child:
                sizedbox() /*ChoosingTimeForSCContainer(
              therapistName: DemoInformation.nameSurname,
              date: DemoInformation.date,
              timeList: DemoInformation.timelist,
              listviewIndex: 3),
        */
            );
      },
      itemCount: 5,
    );
  }
}
