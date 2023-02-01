import 'package:flutter/material.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';
import 'package:terapievim/screen/group/component/group_box.dart';
import 'package:terapievim/screen/group/component/person.dart';

import 'package:terapievim/components/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
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
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                    child: IconUtility.logoutIcon,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomHeading(text: yaklasanToplanti),
              ActivityBox(customButton: customButton),
              SizedBox(
                height: 20,
              ),
              CustomHeading(text: grupBilgiler),
              PersonMin(
                onTap: () {},
                row: row,
                borderColor: AppColors.cornFlowerBlue,
              ),
              PersonMin(
                  onTap: () {},
                  row: row,
                  borderColor: AppColors.cornFlowerBlue),
              CustomHeading(text: katilimcilar),
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 25, right: 25),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: ((context, index) =>
                        PersonMin(onTap: () {}, row: person))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
