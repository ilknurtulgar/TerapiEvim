import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:terapievim/components/container/seminers.dart';
import 'package:terapievim/components/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/row_model.dart';
import 'package:terapievim/models/row_view.dart';
import 'package:terapievim/screen/group/util/lockScreenutility.dart';

class TherapistProfile extends StatelessWidget {
  TherapistProfile({super.key});
  String imagePath = "assets/images/doctorfotosu.jpeg";
  //bu row modeller fix ama nereye koyulacagi tartisilmasi lazim
  RowModel Basetme_metodlari = RowModel(
    text: "Bas Etme Metotlari",
    textStyle: AppTextStyles.GroupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.fileIconBlack,
  );

  RowModel Seminerleri = RowModel(
    text: "Seminerleri",
    textStyle: AppTextStyles.GroupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.activityIcon,
  );
  RowModel MesajGonder = RowModel(
    text: "Mesaj Gonder",
    textStyle: AppTextStyles.GroupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.chatIcon,
  );
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 191,
              color: AppColors.white,
              // padding: EdgeInsets.only(bottom: 550),
            ),
            SizedBox(
              height: 122,
            ),
            Text(
              "Kerem Engin",
              textAlign: TextAlign.center,
              style: AppTextStyles.aboutMeTextStyle(true),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: 265,
              child: Text(
                "Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım",
                textAlign: TextAlign.justify,
                style: AppTextStyles.aboutMeTextStyle(false),
              ),
            ),
            Buttons(Basetme_metodlari),
            Buttons(Seminerleri),
            Buttons(MesajGonder),
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

  Padding Buttons(RowModel row) {
    return Padding(
      padding: paddings.rowViewProfilePadding,
      child: SeminarMin(
        onTap: () {},
        row: row,
        border_color: AppColors.cornFlowerBlue,
      ),
    );
  }
}
