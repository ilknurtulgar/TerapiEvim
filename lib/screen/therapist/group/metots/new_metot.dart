import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/button_group_name_row.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/therapist/activity/companent/coping_box.dart';

// ignore: must_be_immutable
class NewMetot extends StatelessWidget {
  NewMetot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            heading(context),
            CopingBox(
                copingtext: DemoInformation.tmpNewMetotText,
                pdfname: DemoInformation.tmppdfName),
            text(),
            otherGroups(),
          ],
        ),
      ),
    );
  }

  Padding text() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: CustomHeading(
          text: "Ayrica Su Gruplarda da paylas", isalignmentstart: false),
    );
  }

  ListView otherGroups() {
    return ListView.builder(
      itemCount: DemoInformation.groupNames.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => ButtonWithGroupName(
          text: DemoInformation.groupNames[index], index: index),
    );
  }

  Widget heading(BuildContext context) {
    return rowView(
        RowModel(
            text: "Basetme Metodu",
            textStyle: AppTextStyles.heading(false),
            trailingIcon: IconButton(
              icon: IconUtility.deleteIcon,
              onPressed: () {
                deleteMetotDialog(context);
              },
            ),
            isAlignmentBetween: true),
        const EdgeInsets.symmetric(vertical: 33, horizontal: 23));
  }

  Future<void> deleteMetotDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text("Basetme Metodunu Silmek Istediginize Emin Misiniz? "),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Verileriniz Kaydedilmeyecektir.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Vazgec"),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Sil'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
