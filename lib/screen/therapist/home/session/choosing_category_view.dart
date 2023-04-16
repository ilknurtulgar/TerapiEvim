import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/choosing_category.dart';
import 'package:terapievim/core/base/component/group/participant_container.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/therapist/home/session/test_result_view.dart';

// ignore: must_be_immutable
class ChoosingCategoryView extends StatelessWidget {
  ChoosingCategoryView({super.key});

  TextEditingController textController = TextEditingController();
  String chosenCategory = '';
  RxBool isTextfieldVisible = false.obs;

  void callBack(String chosenInComponent) {
    chosenCategory = chosenInComponent;
    print(chosenCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: testViewPageAppBar('Danışanın Grubunu Belirleme', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.pagePaddingHorizontal,
          child: Column(
            children: [
              participantContainer(DemoInformation.personCardModel, 60),
              container(),
              testViewPageButton(() {
                if (chosenCategory == 'Diğer')
                  chosenCategory = textController.text;
                print(chosenCategory);
              }, ActivityTextUtil.save), // kaydetme butonu
            ],
          ),
        ),
      ),
    );
  }

  CustomContainer container() {
    return CustomContainer(
      containerModel: AppContainers.classicWhiteContainer,
      isThereCardModel: false,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Danışanın grubunu seçiniz.',
              style: AppTextStyles.normalTextStyle('medium', false),
            ),
          ),
          ChoosingCategoryForParticipant(
              textfieldVisible: isTextfieldVisible,
              isWithIconButton: true,
              callBack: callBack),
          animatedTextfield(textController,isTextfieldVisible,const EdgeInsets.only(left: 40, right: 20, bottom: 20),),
        ],
      ),
    );
  }
}

Obx animatedTextfield(TextEditingController controller,RxBool isVisible,EdgeInsets padding) {
    return Obx(() => isVisible.value
        ? Padding(
            padding: padding,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: textfieldBorder(),
                  enabledBorder: textfieldBorder(),
                  fillColor: AppColors.white,
                  filled: true),
            ),
          )
        : const SizedBox());
  }
OutlineInputBorder textfieldBorder() {
    return OutlineInputBorder(
        borderRadius: AppBorderRadius.generalBorderRadius,
        borderSide: BorderSide(
          color: AppColors.dustyGray,
          width: 1,
        ));
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
