import 'package:flutter/material.dart';
import 'package:white_label_project/pages/splash/group/group_page.dart';
import 'package:white_label_project/pages/splash/home/home_page.dart';
import 'package:white_label_project/pages/splash/media/media_page.dart';
import 'package:white_label_project/pages/splash/profile/profile_page.dart';
import 'package:white_label_project/pages/splash/shop/shop_page.dart';

// The whole app container based on Tabs
class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _currentIndex = 0;

  List<Widget> pages = [];
  List<BottomNavigationBarItem> itemList = [];

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final tabItems = [
    _TabItem('Home', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _TabItem('Media', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _TabItem('Group', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _TabItem('Market', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _TabItem('Profile', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  @override
  void initState() {
    super.initState();

    debugPrint('App Container init...');

    if (pages.isEmpty) {
      pages = const [
        HomePage(),
        MediaPage(),
        GroupPage(),
        ShopPage(),
        ProfilePage()
      ];
    }

    if (itemList.isEmpty) {
      itemList = tabItems
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width: 30.0,
                height: 30.0,
              ),
              label: item.name,
              activeIcon:
                  Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('App Container Did Update...');
  }
}

class _TabItem {
  String name, activeIcon, normalIcon;

  _TabItem(this.name, this.activeIcon, this.normalIcon);
}
