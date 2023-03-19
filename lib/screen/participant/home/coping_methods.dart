import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/method_downloading_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import 'package:terapievim/screen/participant/home/home.dart';
import 'package:terapievim/screen/therapist/home/session_screen.dart';

class CopingMethods extends StatelessWidget {
  const CopingMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.componentPadding,
            child: Stack(
              children: [
                Column(
                  children: [
                    headingtext(false, true, HomeTextUtil.copingMethods),
                    sizedbox(),
                    methodbuilder()
                  ],
                ),
                Positioned(top: 104, right: 24, child: orderdropdown()),
              ],
            ),
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
}
