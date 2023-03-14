import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

class TherapistProfile extends StatelessWidget {
  TherapistProfile({super.key, required this.isSecTherapist});
  final bool isSecTherapist;

  //bu row modeller fix ama nereye koyulacagi tartisilmasi lazim
  final RowModel basetmeMetodlari = RowModel(
    text: TherapistProfileTextUtil.methods,
    textStyle: AppTextStyles.groupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.fileIcon,
  );

  final RowModel seminerleri = RowModel(
    text: TherapistProfileTextUtil.seminars,
    textStyle: AppTextStyles.groupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.activityIcon,
  );
  final RowModel mesajGonder = RowModel(
    text: GroupTextUtil.sendMessageText,
    textStyle: AppTextStyles.groupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.chatIcon,
  );
  //geciciler assagida
  final String aboutme =
      "Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım";
  final String name = "Kerem Engin";
  @override
  Widget build(BuildContext context) {
    List<RowModel> groups = [
      DemoInformation.grup1,
      DemoInformation.grup2,
      DemoInformation.grup1,
      DemoInformation.grup2
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
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
                  isSecTherapist
                      ? const SizedBox.shrink()
                      : activity(basetmeMetodlari, () {
                          //buraya fonksiyonlari ekelenecek
                          // print("basettin mi");
                        }),
                  activity(seminerleri, () {
                    //print("seminermismis");
                  }),
                  activity(mesajGonder, () {
                    // print("selam");
                  }),
                  isSecTherapist ? otherGroups(groups) : const SizedBox.shrink()
                ],
              ),
              Positioned(
                top: 87,
                // left: 50,
                // right: 50,
                child: CustomCircleAvatar(
                    imagePath: DemoInformation.imagePath,
                    big: true,
                    shadow: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Padding activity(RowModel row, Function() func) {
  return Padding(
    padding: AppPaddings.rowViewProfilePadding,
    child: SeminarMin(
      onTap: func,
      row: row,
      borderColor: AppColors.cornFlowerBlue,
    ),
  );
}

Widget otherGroups(List<RowModel> groups) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      children: [
        CustomHeading(
            padding: AppPaddings.aboutOtherGroupsPadding,
            text: GroupTextUtil.secTherapistGroupsText,
            isalignmentstart: true),
        ListView.builder(
          shrinkWrap: true,
          itemCount: groups.length,
          itemBuilder: (context, index) => activity(groups[index], () => null),
        )
      ],
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

Container aboutMe(String aboutme) {
  return Container(
    padding: AppPaddings.aboutmePadding,
    width: SizeUtil.largeValueWidth,
    child: Text(
      aboutme,
      textAlign: TextAlign.justify,
      style: AppTextStyles.aboutMeTextStyle(false),
    ),
  );
}

Container whiteBackground(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: SizeUtil.highValueHeight,
    color: AppColors.white,
    margin: AppPaddings.whitebackgroundmargin,
  );
}
