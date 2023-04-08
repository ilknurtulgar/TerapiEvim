import 'package:flutter/material.dart';

import '../../../../core/base/util/base_utility.dart';

class ProfileBackIconButton extends StatelessWidget {
  const ProfileBackIconButton({Key? key, required this.onTap})
      : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Responsive.height(25, context),
      left: Responsive.width(20, context),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(onPressed: onTap, icon: IconUtility.back),
      ),
    );
  }
}
