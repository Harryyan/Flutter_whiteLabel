import 'package:flutter/material.dart';
import 'package:white_label_project/widgets/home_tabbar.dart';

var titleList = ['Movies', 'TV Shows', 'Books', 'Videos', 'Music', 'City'];

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = [];
  var tabBar;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    tabs = getTabList();
    _tabController = TabController(vsync: this, length: tabs.length);
    tabBar = HomePageTabBar(tabController: _tabController, tabs: tabs);
  }

  List<Widget> getTabList() {
    return titleList
        .map((item) => Text(
              item,
              style: const TextStyle(fontSize: 15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _getNestedScrollView(Widget tabBar) {
    // String hintText = 'This is hint';
    return Container();

    // return NestedScrollView(
    //     headerSliverBuilder: (context, innerBoxIsScrolled) {
    //       return <Widget>[
    //         SliverToBoxAdapter(
    //           child: Container(
    //             color: Colors.white,
    //             padding: const EdgeInsets.all(10.0),
    //             child: SearchTextFieldWidget(
    //               hintText: hintText,
    //               onTab: () {
    //                 // MyRouter.push(context, MyRouter.searchPage, hintText);
    //               },
    //             ),
    //           ),
    //         ),
    //         SliverPersistentHeader(
    //             floating: true,
    //             pinned: true,
    //             delegate: _SliverAppBarDelegate(
    //                 maxHeight: 49.0,
    //                 minHeight: 49.0,
    //                 child: Container(
    //                   color: Colors.white,
    //                   child: tabBar,
    //                 )))
    //       ];
    //     },
    //     body: Container());
  }
}
