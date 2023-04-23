import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/choosing_category.dart';
import 'package:terapievim/core/base/component/group/participant_container.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/model/therapist/session/t_session_model.dart';
import 'package:terapievim/screen/therapist/home/session/test_result_view.dart';

import '../../../../controller/therapist/home/session/t_choose_category_controller.dart';
import '../../../../core/base/view/base_view.dart';

// ignore: must_be_immutable
class ChoosingCategoryView extends StatelessWidget {
  ChoosingCategoryView({super.key, required this.session});

  final TSessionModel session;

  TextEditingController textController = TextEditingController();

  String chosenCategory = '';

  void callBack(String chosenInComponent) {
    chosenCategory = chosenInComponent;
    print(chosenCategory);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TChooseCategoryController>(
      getController: TChooseCategoryController(),
      onModelReady: (controller) {
        controller.setContext(context);
        controller.setSessionModel(session);
      },
      onPageBuilder: (context, controller) => Scaffold(
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
                  controller.setCategory();
                }, ActivityTextUtil.save), // kaydetme butonu
              ],
            ),
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
              isWithIconButton: true,
              callBack: callBack),
        ],
      ),
    );
  }
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

List<String> groups = [
'Depresyon',
'Bipolar bozukluk',
'Kişilik bozuklukları',
'Obsesik kompulsif bozukluk',
'Panik bozukluğu',
'Anksiyete bozukluğu',
'Yas ve kayıp problemleri',
'Çocukluk travmaları',
'Yeme bozuklukları',
'Uyku bozuklukları',
'Ebeveyn- çocuk ilişkisi', 
'Stres bozukluğu',
'Özgüven eksikliği'
];
