part of '../main_home.dart';

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem(
    this.icon,
    this.theme,
    this.isSelected, {
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final ThemeData theme;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.bottomNavBarIcon,
      child: Icon(
        icon,
        color: isSelected
            ? theme.bottomNavigationBarTheme.selectedIconTheme?.color
            : theme.bottomNavigationBarTheme.unselectedIconTheme?.color,
      ),
    );
  }
}
