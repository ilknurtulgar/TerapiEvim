import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/method_downloading_container.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

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
              headingtext(false, true, "BAŞ ETME METOTLARI"),
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
            buttonText: "Metotu Oku");
      },
      itemCount: DemoInformation.home.length,
    );
  }

  Widget filter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: CustomDropDown(purpose: orderingList, height: 40, width: 135),
      ),
    );
  }
}
