import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

// ignore: must_be_immutable
class GroupInformation extends StatelessWidget {
  GroupInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          heading(context),
          miniHeadings("Yaklasan Toplanti", false),
          meeting(),
          miniHeadings("Grubun Bilgileri", false),
          navMethod(DemoInformation.secTherapist, () {}),
          //dropdownlu component gelecek katilimcilar
          navMethod(DemoInformation.methods, () {}),
        ],
      ),
    );
  }

  ActivityBox meeting() {
    return ActivityBox(
        istwobutton: false,
        containerModel: AppContainers.containerButton(false),
        buttonText: "Baslat",
        arowModel: RowModel(
          leadingIcon: IconUtility.personIcon,
          isAlignmentBetween: false,
          text: "Yardimci Psikolog: ",
          textStyle: AppTextStyles.aboutMeTextStyle(false),
          text2: "Ozlem Ulusan", //sadece isim alinacak
          textStyle2: AppTextStyles.groupTextStyle(true),
        ),
        isactivity: true,
        clockModel: RowModel(
          leadingIcon: IconUtility.clockIcon,
          text: "Ocak 15, 2023,  20:00",
          textStyle: AppTextStyles.groupTextStyle(true),
          isAlignmentBetween: false,
        ));
  }

  Padding navMethod(RowModel row, Function func) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child:
          SeminarMin(borderColor: AppColors.meteorite, onTap: func(), row: row),
    );
  }

  Widget heading(BuildContext context) {
    return rowView(
        RowModel(
            leadingIcon: Icon(Icons.arrow_back_ios_new),
            text: "Anksiyete 1",
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: true,
            trailingIcon: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit_document),
                  onPressed: () {
                    //new Metot sayfasina godocek
                  },
                ),
                IconButton(
                  icon: IconUtility.deleteIcon,
                  onPressed: () {
                    deleteGroupDialog(context);
                  },
                )
              ],
            )),
        EdgeInsets.symmetric(vertical: 25, horizontal: 10));
  }

  Future<void> deleteGroupDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Grubu Silmek Istediginize Emin Misiniz? "),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Silinen gruplar geri getirilemez.'),
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

  Widget miniHeadings(String name, bool isInMiddle) {
    return rowView(
        RowModel(
            text: name,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: false),
        EdgeInsets.symmetric(vertical: 16, horizontal: isInMiddle ? 10 : 0));
  }
}
