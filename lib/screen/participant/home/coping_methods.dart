import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/method_downloading_container.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import 'package:terapievim/screen/participant/home/home.dart';

class CopingMethods extends StatelessWidget {
  const CopingMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              headingtext(false, true, HomeTextUtil.copingMethods),
              filter(),
              methodbuilder()
            ],
          ),
        ),
      ),
    );
  }

  ListView methodbuilder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MethodDownloadingContainer(
            cardModel: DemoInformation.cardModelhome,
            time: DemoInformation.clockabomeactivty,
            explanation: DemoInformation.home[index],
            buttonOnTap: () {},
            buttonText: HomeTextUtil.readMethod);
      },
      itemCount: DemoInformation.home.length,
    );
  }

  Widget filter() {
    return const Padding(
      padding: AppPaddings.generalPadding,
      child: Align(
        alignment: Alignment.bottomRight,
        child: CustomDropDown(
            purpose: DemoInformation.orderingList, height: 40, width: 135),
      ),
    );
  }
}
