import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/button_group_name_row.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/therapist/activity/companent/coping_box.dart';

class NewMetot extends StatelessWidget {
  NewMetot({super.key});
  String tmpNewMetotText = "Yeni Yazimda size bla bla anlattim";
  String tmppdfName = "YeniliklerleBasaCikma.pdf";
  List<String> groupNames = [
    "Depresyon 1",
    "Depresyon 2",
    "Anksiyete 1",
    "Bulmia 1",
    "Yas 1"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            rowView(
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
                EdgeInsets.symmetric(vertical: 33, horizontal: 23)),
            CopingBox(copingtext: tmpNewMetotText, pdfname: tmppdfName),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: CustomHeading(
                  text: "Ayrica Su Gruplarda da paylas",
                  isalignmentstart: false),
            ),
            ListView.builder(
              itemCount: groupNames.length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  ButtonWithGroupName(text: groupNames[index], index: index),
            ),
          ],
        ),
      ),
    );
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
