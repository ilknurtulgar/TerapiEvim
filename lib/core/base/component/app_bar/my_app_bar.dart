import 'package:flutter/material.dart';

import '../../util/base_utility.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.height = SizeUtil.appBarHeight,
    required this.title,
  });
  final String title;
  final double height;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.blueChalk,
        elevation: 0,
        title: Padding(
          padding: AppPaddings.miniTopPadding * 3,
          child: Text(
            title,
            style: AppTextStyles.heading(false),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
