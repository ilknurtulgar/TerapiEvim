import 'package:flutter/material.dart';

import '../../../../core/base/util/base_utility.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {super.key,
      required this.imagePath,
      required this.big,
      required this.shadow});
  final String imagePath;
  final bool big; //buyukse radius 100 kkucuk ise 40
  final bool shadow; //mor golge var mi yok mu

  @override
  Widget build(BuildContext context) {
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
}
