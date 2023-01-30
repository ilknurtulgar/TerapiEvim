import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:terapievim/components/box/activitty_box.dart';
import 'package:terapievim/components/buttons/custom_button.dart';
import 'package:terapievim/components/container/person.dart';
import 'package:terapievim/components/image/custom_circle_avatar.dart';
import 'package:terapievim/components/text/custom_heading.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/container_model.dart';
import 'package:terapievim/models/row_model.dart';

class MyGroup extends StatelessWidget {
  const MyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/doctorfotosu.jpeg";
    RowModel row = RowModel(
        leadingIcon: IconUtility.personIcon,
        text: "Grup Terapisti : ",
        textStyle: AppTextStyles.GroupTextStyle(false),
        text2: "Simay Odabasi",
        textStyle2: AppTextStyles.GroupTextStyle(true),
        trailingIcon: IconUtility.sendIcon);
    RowModel row2 = RowModel(
        leadingIcon: IconUtility.personIcon,
        text: "Yardimci Psikolog: ",
        textStyle: AppTextStyles.GroupTextStyle(false),
        text2: "Ozlem Ulusan",
        textStyle2: AppTextStyles.GroupTextStyle(true),
        trailingIcon: IconUtility.sendIcon);
    RowModel person = RowModel(
        leadingIcon:
            CustomCircleAvatar(big: false, shadow: false, imagePath: imagePath),
        text: "Aleyna Tilki",
        textStyle: AppTextStyles.GroupTextStyle(true));
    String yaklasanToplanti = "Yaklasan Toplanti";
    String grupBilgiler = "Grup Bilgileri";
    String katilimcilar = "Katilimcilar";
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(width: 130),
              Text(
                "Grubum",
                style: AppTextStyles.heading(true),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 100,
              ),
              Container(
                child: Icon(Icons.arrow_back),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          CustomHeading(text: yaklasanToplanti),
          SizedBox(
            height: 166,
            width: 342,
          ),
          CustomHeading(text: grupBilgiler),
          PersonMin(
            onTap: () {},
            row: row,
            border_color: AppColors.cornFlowerBlue,
          ),
          SizedBox(
            height: 16,
          ),
          PersonMin(
              onTap: () {}, row: row, border_color: AppColors.cornFlowerBlue),
          SizedBox(
            height: 20,
          ),
          CustomHeading(text: katilimcilar),
          PersonMin(onTap: () {}, row: person)
        ],
      ),
    );
  }
}
