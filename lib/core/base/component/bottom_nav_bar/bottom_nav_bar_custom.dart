import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../extension/context_extension.dart';
import '../../../init/config/config.dart';
import '../../util/base_utility.dart';

const double _kTabBarHeight = 50.0;

const Color _kDefaultTabBarBorderColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x4C000000),
  darkColor: Color(0x29000000),
);
const Color _kDefaultTabBarInactiveColor = CupertinoColors.inactiveGray;

class CupertinoTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a tab bar in the iOS style.
  const CupertinoTabBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor = _kDefaultTabBarInactiveColor,
    this.iconSize = 30.0,
    this.height = _kTabBarHeight,
    this.border = const Border(
      top: BorderSide(
        color: _kDefaultTabBarBorderColor,
        width: SizeUtil.zeroSize, // 0.0 means one physical pixel
      ),
    ),
  })  : assert(
          items.length >= 2,
          //  "Tabs need at least 2 items to conform to Apple's HIG",
        ),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(height >= 0.0);

  /// The interactive items laid out within the bottom navigation bar.
  ///
  /// Must not be null.
  final List<BottomNavigationBarItem> items;

  /// The callback that is called when a item is tapped.
  ///
  /// The widget creating the bottom navigation bar needs to keep track of the
  /// current index and call `setState` to rebuild it with the newly provided
  /// index.
  final ValueChanged<int>? onTap;

  /// The index into [items] of the current active item.
  ///
  /// Must not be null and must inclusively be between 0 and the number of tabs
  /// minus 1.
  final int currentIndex;

  /// The background color of the tab bar. If it contains transparency, the
  /// tab bar will automatically produce a blurring effect to the content
  /// behind it.
  ///
  /// Defaults to [CupertinoTheme]'s `barBackgroundColor` when null.
  final Color? backgroundColor;

  /// The foreground color of the icon and title for the [BottomNavigationBarItem]
  /// of the selected tab.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryColor` if null.
  final Color? activeColor;

  /// The foreground color of the icon and title for the [BottomNavigationBarItem]s
  /// in the unselected state.
  ///
  /// Defaults to a [CupertinoDynamicColor] that matches the disabled foreground
  /// color of the native `UITabBar` component. Cannot be null.
  final Color inactiveColor;

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// This value is used to configure the [IconTheme] for the navigation bar.
  /// When a [BottomNavigationBarItem.icon] widget is not an [Icon] the widget
  /// should configure itself to match the icon theme's size and color.
  ///
  /// Must not be null.
  final double iconSize;

  /// The height of the [CupertinoTabBar].
  ///
  /// Defaults to 50.0. Must not be null.
  final double height;

  /// The border of the [CupertinoTabBar].
  ///
  /// The default value is a one physical pixel top border with grey color.
  final Border? border;

  @override
  Size get preferredSize => Size.fromHeight(height);

  /// Indicates whether the tab bar is fully opaque or can have contents behind
  /// it show through it.
  bool opaque(BuildContext context) {
    final Color backgroundColor =
        this.backgroundColor ?? CupertinoTheme.of(context).barBackgroundColor;
    return CupertinoDynamicColor.resolve(backgroundColor, context).alpha ==
        0xFF;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    final bool isAndroid = Config.instance.isAndroid;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    final Color inactive =
        CupertinoDynamicColor.resolve(inactiveColor, context);

    Widget result = DecoratedBox(
      decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor),
      child: SizedBox(
        height: height + bottomPadding + 1,
        child: IconTheme.merge(
          // Default with the inactive state.
          data: IconThemeData(color: inactive, size: iconSize),
          child: DefaultTextStyle(
            // Default with the inactive state.
            style: CupertinoTheme.of(context)
                .textTheme
                .tabLabelTextStyle
                .copyWith(color: inactive),
            child: Padding(
              padding: EdgeInsets.only(bottom: isAndroid ? bottomPadding : 0),
              child: Semantics(
                explicitChildNodes: true,
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoDynamicColor.resolve(
                      //TODO: background color
                      Colors.white,
                      context,
                    ),
                  ),
                  padding:
                      EdgeInsets.only(bottom: isAndroid ? bottomPadding : 0),
                  child: Row(
                    // Align bottom since we want the labels to be aligned.
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: _buildTabItems(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (!opaque(context)) {
      // For non-opaque backgrounds, apply a blur effect.
      result = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: result,
        ),
      );
    }
    return result;
  }

  List<Widget> _buildTabItems(BuildContext context) {
    final List<Widget> result = <Widget>[];
    final CupertinoLocalizations localizations =
        CupertinoLocalizations.of(context);
    final bool isAndroid = Config.instance.isAndroid;

    for (int index = 0; index < items.length; index += 1) {
      final bool active = index == currentIndex;
      result.add(
        _wrapActiveItem(
          context,
          Expanded(
            child: Semantics(
              selected: active,
              hint: localizations.tabSemanticsLabel(
                tabIndex: index + 1,
                tabCount: items.length,
              ),
              child: MouseRegion(
                cursor: kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onTap == null
                      ? null
                      : () {
                          onTap!(index);
                        },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: isAndroid ? 0 : 4.0, bottom: 3.0),
                    child: Column(
                      mainAxisAlignment: isAndroid
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children:
                          _buildSingleTabItem(items[index], active, context),
                    ),
                  ),
                ),
              ),
            ),
          ),
          active: active,
        ),
      );
    }

    return result;
  }

  List<Widget> _buildSingleTabItem(
      BottomNavigationBarItem item, bool active, BuildContext context) {
    return <Widget>[
      smallSizedBox(),
      Center(
        child: SizedBox(
          height: SizeUtil.lowValueHeight,
          width: SizeUtil
              .lowValueHeight, // height ve width değerleri birbirine eşit olması gerektiği için width'e height değeri verdim
          child: active ? item.activeIcon : item.icon,
        ),
      ),
      const SizedBox(height: 2),
      if (item.label != null)
        Text(
          item.label!,
          style: context.theme.bottomNavigationBarTheme.selectedLabelStyle,
        ),
      const SizedBox(height: 4)
    ];
  }

  /// Change the active tab item's icon and title colors to active.
  Widget _wrapActiveItem(BuildContext context, Widget item,
      {required bool active}) {
    if (!active) {
      return item;
    }

    final Color activeColor = CupertinoDynamicColor.resolve(
      this.activeColor ?? CupertinoTheme.of(context).primaryColor,
      context,
    );
    return IconTheme.merge(
      data: IconThemeData(color: activeColor),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: activeColor),
        child: item,
      ),
    );
  }

  /// Create a clone of the current [CupertinoTabBar] but with provided
  /// parameters overridden.
  CupertinoTabBar copyWith({
    Key? key,
    List<BottomNavigationBarItem>? items,
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    double? iconSize,
    double? height,
    Border? border,
    int? currentIndex,
    ValueChanged<int>? onTap,
  }) {
    return CupertinoTabBar(
      key: key ?? this.key,
      items: items ?? this.items,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      iconSize: iconSize ?? this.iconSize,
      height: height ?? this.height,
      border: border ?? this.border,
      currentIndex: currentIndex ?? this.currentIndex,
      onTap: onTap ?? this.onTap,
    );
  }
}
