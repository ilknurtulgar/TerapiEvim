import 'package:flutter/material.dart';
import '../../core/base/util/base_utility.dart';

Widget customCircleAvatar(
    String imagePath,
    bool big, //buyukse radius 100 kkucuk ise 40
    bool shadow) //mor golge var mi yok mu
{
  return shadow
      ? CircleAvatar(
          radius: big ? 102 : 22,
          backgroundColor: AppColors.meteorite,
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: big ? 100 : 20,
          ),
        )
      : CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: big ? 100 : 20,
        );
}
