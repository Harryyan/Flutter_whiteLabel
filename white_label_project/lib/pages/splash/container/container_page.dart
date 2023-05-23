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
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('App Container Did Update...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4)
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _currentIndex = index;
            //这个是用来控制比较特别的shopPage中WebView不能动态隐藏的问题
            // shopPageWidget.setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _currentIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  //Stack+Offstage to solve page reset issue
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: TickerMode(
        enabled: _currentIndex == index,
        child: pages[index],
      ),
    );
  }
}

class _TabItem {
  String name, activeIcon, normalIcon;

  _TabItem(this.name, this.activeIcon, this.normalIcon);
}
