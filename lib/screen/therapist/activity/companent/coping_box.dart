import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CopingBox extends StatelessWidget {
  const CopingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.notificationDec,
      width: 342,
      child: Column(
        children: [
          CustomHeading(
            padding: const EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
              bottom: 25,
            ),
            text:
                "Yeni yazmda size bla bla anlattımvmfFlutter, Google tarafından oluşturulan açık kaynaklı bir UI yazılım geliştirme kitidir. Android, iOS, Windows, Mac, Linux ve web için uygulamalar geliştirmek için kullanılıyor. Flutter'ın ilk sürümü  olarak biliniyordu ve Android işletim sisteminde çalışıyordu.",
            isalignmentstart: true,
            isToggle: true,
          ),
          Container(
            decoration: AppBoxDecoration.lockScreenBox,
            width: 248,
            height: 47,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Text("YeniliklerleBaşaÇıkmak.pdf",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.normalTextStyle("medium", false)),
            ),
          ),
          Row(
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
          )
        ],
      ),
    );
  }
}
