import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CopingBox extends StatelessWidget {
  const CopingBox({super.key, required this.copingtext, required this.pdfname});
  final String copingtext;
  final String pdfname;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.notificationDec,
      width: 342,
      child: Column(
        children: [heading(), pdfcontainer(), rowbutton()],
      ),
    );
  }

  Row rowbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 25, bottom: 20),
          child: CustomButton(
              icon: IconUtility.fileIcon,
              container: ContainerModel(
                  width: 116,
                  height: 42,
                  shadowColor: AppColors.cornFlowerBlue,
                  borderRadius: 5,
                  backgroundColor: Colors.white),
              textColor: Colors.black,
              onTap: () {
                print("tıklandı");
              },
              text: "Ekle"),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 25, bottom: 20),
          child: CustomButton(
              container: ContainerModel(
                  width: 116,
                  height: 42,
                  shadowColor: AppColors.cornFlowerBlue,
                  borderRadius: 5,
                  backgroundColor: Colors.white),
              textColor: Colors.black,
              onTap: () {
                print("tıklandı");
              },
              text: "Paylaş"),
        )
      ],
    );
  }

  CustomHeading heading() {
    return CustomHeading(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
        bottom: 25,
      ),
      text: copingtext,
      isalignmentstart: true,
      isToggle: true,
    );
  }

  Container pdfcontainer() {
    return Container(
      decoration: AppBoxDecoration.lockScreenBox,
      width: 248,
      height: 47,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Text(pdfname,
            textAlign: TextAlign.center,
            style: AppTextStyles.normalTextStyle("medium", false)),
      ),
    );
  }
}
