import 'package:flutter/material.dart';

import '../../util/base_utility.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
    this.height = SizeUtil.appBarHeight,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.actions,
    this.leading,
  });

  final String title;
  final double height;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading, centerTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: AppPaddings.appBarPaddingNew,
      child: AppBar(
        backgroundColor: AppColors.blueChalk,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: leading,
        centerTitle: centerTitle,
        elevation: 0,
        title: Text(
          title,
          style: AppTextStyles.heading(false),
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
