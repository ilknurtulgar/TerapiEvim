import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/model/therapist/session/t_session_model.dart';
import 'package:terapievim/screen/therapist/home/session/choosing_category_view.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/component/group/participant_container.dart';
import '../../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class TestResultView extends StatelessWidget {
  TestResultView({
    super.key, required this.session,
  });

  final TSessionModel session;
  late List<TableRow> rows = List.generate(categories.length + 1, (index) {
    if (index == 0)
      return tableRow('Belirtiler', 'Puan', true);
    else if (index == categories.length)
      return tableRow('', '', false);
    else
      return tableRow(categories[index - 1],
          DemoInformation.result[index - 1].toString(), false);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: testViewPageAppBar('''SCL-90-R Belirti Tarama
          Testi Sonucu''', context),
      body: Padding(
        padding: AppPaddings.pagePaddingHorizontal,
        child: Column(
          children: [
            participantContainer(DemoInformation.personCardModel, 60),
            container(),
            testViewPageButton(
                    () => context.push(ChoosingCategoryView(session:session)), 'Grubu Belirle')
          ],
        ),
      ),
    );
  }

  CustomContainer container() {
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
}

MyAppBar testViewPageAppBar(String title, BuildContext context) =>
    MyAppBar(
      title: title,
      leading:
      IconButton(onPressed: () => context.pop(), icon: IconUtility.back),
    );

Align testViewPageButton(Function() onTap, String buttonText) {
  return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: AppPaddings.componentOnlyPadding(1),
        child: CustomButton(
            container:
            AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth),
            textColor: AppColors.white,
            onTap: onTap,
            text: buttonText),
      ));
}
