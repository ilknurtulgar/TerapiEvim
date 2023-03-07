part of '../main_home.dart';

Widget Function(BuildContext, int) _tabBuilder() {
  return (BuildContext context, int index) {
    switch (index) {
      case 0:
        return CupertinoTabView(builder: (context) {
          return  const CupertinoPageScaffold(child: HomeScreen());
        });
      case 1:
        return CupertinoTabView(builder: (context) {
          return const CupertinoPageScaffold(child: ActivitiesScreen());
        });
      case 2:
        return CupertinoTabView(builder: (context) {
          return  CupertinoPageScaffold(child: GroupScreen());
        });
      case 3:
        return CupertinoTabView(builder: (context) {
          return  CupertinoPageScaffold(child: MessageScreen());
        });
        case 4:
        return CupertinoTabView(builder: (context) {
          return  const CupertinoPageScaffold(child: ParticipantProfilePage());
        });
      default:
        return Container();
    }
  };
}
