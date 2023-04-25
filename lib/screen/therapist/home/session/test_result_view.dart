import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/home/session/t_test_result_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/model/therapist/session/t_session_model.dart';
import 'package:terapievim/screen/therapist/home/session/choosing_category_view.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/group/participant_container.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../model/common/scl_90/scl_90_result_model.dart';

// ignore: must_be_immutable
class TestResultView extends StatelessWidget {
  TestResultView({
    super.key,
    required this.session,
  });
  final TSessionModel session;
  @override
  Widget build(BuildContext context) {
    return BaseView<TTestResultController>(
        getController: TTestResultController(),
        onModelReady: (controller) {
          controller.setContext(context);
          controller.setSessionModel(session);
        },
        onPageBuilder: (context, controller) => Scaffold(
              appBar: testViewPageAppBar('''SCL-90-R Belirti Tarama
              Testi Sonucu''', context),
              body: Padding(
                padding: AppPaddings.pagePaddingHorizontal,
                child: Column(
                  children: [
                    participant(controller.session.participantName ?? ""),
                    Obx(() => container(generateRows(
                        controller.result.value ?? Scl90ResultModel()))),
                    testViewPageButton(
                        () => context
                            .push(ChoosingCategoryView(session: session)),
                        'Grubu Belirle'),
                    CustomContainer(
                      isThereCardModel: false,
                      containerModel: AppContainers.classicWhiteContainer,
                      widget: Padding(
                        padding: AppPaddings.customContainerInsidePadding(3),
                        child: Column(
                          children: List.generate(testResultInformation.length, (index) => Text(testResultInformation[index],style: AppTextStyles.normalTextStyle('medium', false),)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

CustomContainer container(List<TableRow> rows) {
  return CustomContainer(
    isThereCardModel: false,
    containerModel: AppContainers.classicWhiteContainer,
    widget: Table(
      border: TableBorder.symmetric(
          inside: BorderSide(color: AppColors.black, width: 2)),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FixedColumnWidth(70),
      },
      children: rows,
    ),
  );
}

TableRow tableRow(String category, String point, bool isFirstRow) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.only(left: 16, top: isFirstRow ? 20 : 5, bottom: 5),
      child: Text(
        category,
        style: AppTextStyles.normalTextStyle('medium', false),
      ),
    ),
    TableCell(
        verticalAlignment: isFirstRow
            ? TableCellVerticalAlignment.bottom
            : TableCellVerticalAlignment.middle,
        child: Padding(
          padding: isFirstRow ? EdgeInsets.only(bottom: 5) : EdgeInsets.zero,
          child: Text(
            point,
            style: AppTextStyles.normalTextStyle('medium', false),
            textAlign: TextAlign.center,
          ),
        )),
  ]);
}

MyAppBar testViewPageAppBar(String title, BuildContext context) => MyAppBar(
      title: title,
      leading:
          IconButton(onPressed: () => context.pop(), icon: IconUtility.back),
    );

Align testViewPageButton(Function() onTap, String buttonText) {
  return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: AppPaddings.componentPadding,
        child: CustomButton(
            container:
                AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth),
            textColor: AppColors.white,
            onTap: onTap,
            text: buttonText),
      ));
}

List<TableRow> generateRows(Scl90ResultModel result) =>
    List.generate(categories.length + 1, (index) {
      if (index == 0)
        return tableRow('Belirtiler', 'Yüzde', true);
      else
        return tableRow(
            categories[index - 1], getPoints(result)[index - 1], false);
    });

List<String> getPoints(Scl90ResultModel result) {
  List<String> points = [];
  points.add(result.somatization.toString());
  points.add(result.oKB.toString());
  points.add(result.interpersonalSensitivity.toString());
  points.add(result.depression.toString());
  points.add(result.anxiety.toString());
  points.add(result.angerEnmity.toString());
  points.add(result.phobicAnxiety.toString());
  points.add(result.paranoidThought.toString());
  points.add(result.psychoticism.toString());
  points.add(result.additionalScales.toString());
  return points;
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
  'Diğer',
];

List<String> testResultInformation = [
'0,00’dan 37,50’ye kadar olan puanlar NORMAL',
'37,51‘den 62,50 arasındakiler ARAZ DÜZEYİ YÜKSEK',
'62,51‘den 100,00 arasındakiler ARAZ DÜZEYİ ÇOK YÜKSEK olarak kabul edilir.',
];

