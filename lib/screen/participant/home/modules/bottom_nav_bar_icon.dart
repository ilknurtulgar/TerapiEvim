part of '../main_home.dart';

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem(
    this.index,
    this.theme,
    this.isSelected, {
    Key? key,
  }) : super(key: key);
  final int index;
  final ThemeData theme;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.bottomNavBarIcon,
      child: Icon(
        IconUtility.bottomnavigateIcons[index],
        color: isSelected ? AppColors.black : AppColors.dustyGray,
      ),
    );
  }
}
