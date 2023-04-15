import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/participant_container.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ChoosingCategoryView extends StatelessWidget {
  ChoosingCategoryView({super.key});
  RxList<bool> isSelected = RxList.filled(categories.length, false);
  late List<Widget> children = List.generate(categories.length, (index) => iconButtonWithText(index));
  TextEditingController textController = TextEditingController();
  RxBool isTextfieldVisible = false.obs;
  // TO DO
     // Kaydet butonu
     // Appbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              participantContainer(DemoInformation.cardModelhome, 70), // ikonlu container gelecek
              CustomContainer(
                containerModel: AppContainers.classicWhiteContainer,
                isThereCardModel: false,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 20),
                      child: Text('Danışanın grubunu seçiniz.'),
                    ),
                    toggleButtons(),
                    animatedTextfield(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align toggleButtons() {
    return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: AppPaddings.componentOnlyPadding(4),
                    child: ToggleButtons(
                      onPressed: (index) {
                        for (int i = 0; i < categories.length; i++) {
                          isSelected[i] = i == index;
                        }
                        if (isSelected.last == true) isTextfieldVisible.value = true;
                        else isTextfieldVisible.value =false;
                      },
                      direction: Axis.vertical,
                      color: AppColors.black,
                      borderColor: AppColors.transparent,
                      selectedBorderColor: AppColors.transparent,
                      fillColor: AppColors.transparent,
                      splashColor: AppColors.transparent,
                      children: children,
                      isSelected: isSelected,
                    ),
                  ),
                );
  }

  Obx animatedTextfield() {
    return Obx(
                  () => AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: isTextfieldVisible.value ? 70 : 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 20, bottom: 20),
                      child: TextField(
                              controller: textController,
                              decoration: InputDecoration(
                                focusedBorder: textfieldBorder(),
                                enabledBorder: textfieldBorder()
                              ),
                      ),
                    ),
                  ),
                );
  }

  OutlineInputBorder textfieldBorder() {
    return OutlineInputBorder(
                                  borderRadius: AppBorderRadius.generalBorderRadius,
                                  borderSide: BorderSide(
                                    color: isTextfieldVisible.value ? AppColors.dustyGray : AppColors.transparent,
                                    width: isTextfieldVisible.value ? 1 : 0,
                                  ),
                                );
  }

  Widget iconButtonWithText(int index) {
    return Row(
      children: [
        Obx(() => isSelected[index]
            ? IconUtility.filledCircle
            : IconUtility.circleIcon),
        Padding(
          padding: AppPaddings.componentOnlyPadding(4),
          child: Text(categories[index]),
        ),
      ],
    );
  }
}

List<String> categories = [
  'Somatizasyon',
  'Obsesif-Kompulsif',
  'Kişiler Arası Duyarlılık',
  'Depresyon',
  'Kaygı',
  'Ofke-Hostilite',
  'Fobik Anksiyete',
  'Paranoid Düşünce',
  'Psikotizm',
  'Uyku-İştah',
  'Diğer',
];
