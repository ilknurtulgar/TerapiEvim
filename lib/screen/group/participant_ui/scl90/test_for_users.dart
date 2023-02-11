import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/component/heading.dart';
import 'package:terapievim/screen/group/component/purple_border_text_ccontainer.dart';
import 'package:terapievim/screen/group/component/questions_button.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        const Heading(headingText: "Psikolijik Tarama Testi"),
        const PurpleBorderWhiteInsideTextContainer(
            text:
                "Kendine en uygun grubu bulabilmesi ve en efektif yardimi alabilmesi adina psikolojik test olan   testini ve 15 dakikalık terapist görüşmesi ölçeklerini kullanarak grup kategorileriniz açılmaktadır. "),
        togglebuttonsview(),
        togglebuttonsview(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
                container: ContainerModel(
                    backgroundColor: AppColors.meteorite,
                    borderRadius: 100,
                    height: 40,
                    width: 123),
                onTap: () {},
                text: "Onceki Sayfa"),
            CustomButton(
                container: ContainerModel(
                    backgroundColor: AppColors.meteorite,
                    borderRadius: 100,
                    height: 40,
                    width: 123),
                onTap: () {},
                text: "Sonraki Sayfa"),
          ],
        )
      ]),
    );
  }
}
