import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../components/container/person.dart';
import '../../components/image/custom_circle_avatar.dart';
import '../../components/text/custom_heading.dart';
import '../../core/base/util/base_utility.dart';
import '../../models/row_model.dart';

class MyGroup2 extends StatelessWidget {
  const MyGroup2({super.key});

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
                  onTap: () {},
                  row: row,
                  border_color: AppColors.cornFlowerBlue),
              SizedBox(
                height: 20,
              ),
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
