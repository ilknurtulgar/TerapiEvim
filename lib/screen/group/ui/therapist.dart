import 'package:flutter/material.dart';
import 'package:terapievim/components/container/seminers.dart';
import 'package:terapievim/components/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/row_model.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';

import 'package:terapievim/screen/group/util/lockScreenutility.dart';

class TherapistProfile extends StatelessWidget {
  TherapistProfile({super.key});
  final String imagePath = "assets/images/doctorfotosu.jpeg";
  //bu row modeller fix ama nereye koyulacagi tartisilmasi lazim
  final RowModel basetmeMetodlari = RowModel(
    text: "Bas Etme Metotlari",
    textStyle: AppTextStyles.GroupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.fileIconBlack,
  );

  final RowModel seminerleri = RowModel(
    text: "Seminerleri",
    textStyle: AppTextStyles.GroupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.activityIcon,
  );
  final RowModel mesajGonder = RowModel(
    text: "Mesaj Gonder",
    textStyle: AppTextStyles.GroupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.chatIcon,
  );
  //geciciler assagida
  final String aboutme =
      "Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım";
  final String name = "Kerem Engin";
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.rtl,
      fit: StackFit.loose,
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            whiteBackground(context),
            heading(name),
            aboutMe(aboutme),
            activity(basetmeMetodlari, () {
              //buraya fonksiyonlari ekelenecek
              print("basettin mi");
            }),
            activity(seminerleri, () {
              print("seminermismis");
            }),
            activity(mesajGonder, () {
              print("selam");
            }),
          ],
        ),
        Positioned(
          top: 87,
          left: 50,
          right: 50,
          child:
              CustomCircleAvatar(imagePath: imagePath, big: true, shadow: true),
        )
      ],
    );
  }

  Container aboutMe(String aboutme) {
    return Container(
      padding: GroupPaddings.aboutmePadding,
      width: 265,
      child: Text(
        aboutme,
        textAlign: TextAlign.justify,
        style: AppTextStyles.aboutMeTextStyle(false),
      ),
    );
  }

  Text heading(name) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: AppTextStyles.aboutMeTextStyle(true),
    );
  }

  Container whiteBackground(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 191,
      color: AppColors.white,
      margin: GroupPaddings.whitebackgroundmargin,
    );
  }

  Padding activity(RowModel row, Function() func) {
    return Padding(
      padding: paddings.rowViewProfilePadding,
      child: SeminarMin(
        onTap: func,
        row: row,
        border_color: AppColors.cornFlowerBlue,
      ),
    );
  }
}
