import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/method_downloading_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import 'package:terapievim/screen/therapist/home/session_screen.dart';

import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/util/base_model.dart';

class CopingMethods extends StatelessWidget {
  const CopingMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: AppPaddings.pagePadding,
                child: Column(
                  children: [approw(context), sizedbox(), methodbuilder()],
                ),
              ),
              Positioned(top: 80, right: 24, child: orderdropdown()),
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
}

Widget approw(
  BuildContext context,
) {
  return rowView(
      UiBaseModel.leadinfRowModel(backButton(context, () => context.pop()),
          HomeTextUtil.copingMethods, false),
      AppPaddings.mediumxPadding);
}
