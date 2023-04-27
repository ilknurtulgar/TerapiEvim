import 'package:flutter/material.dart';
import 'package:terapievim/core/constants/app_const.dart';

import '../../../util/base_utility.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {super.key,
      this.imagePath = AppConst.temporaryImage,
      required this.big,
      required this.shadow,
      this.isNetworkImage = false});
  final String imagePath;
  final bool big; //buyukse radius 100 kkucuk ise 40
  final bool shadow; //mor golge var mi yok mu
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return shadow
        ? CircleAvatar(
            radius: big ? 102 : 22,
            backgroundColor: AppColors.meteorite,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imagePath),
              radius: big ? 100 : 20,
            ),
          )
        : CircleAvatar(
            backgroundImage: AssetImage(imagePath), radius: big ? 100 : 20);
  }
}
