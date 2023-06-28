import "package:flutter/material.dart";

// ignore: must_be_immutable
class HomePageTabBar extends StatefulWidget {
  TabController tabController;
  List<Widget> tabs;

  HomePageTabBar(Key key, this.tabController, this.tabs) : super(key: key);

  @override
  State<HomePageTabBar> createState() => _HomePageTabBarState();
}

class _HomePageTabBarState extends State<HomePageTabBar> {
  late Color selectColor, unselectedColor;
  late TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    super.initState();

    selectColor = Colors.black;
    unselectedColor = const Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 18, color: selectColor);
  }

  @override
  void dispose() {
    widget.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TabBar(
        tabs: widget.tabs,
        isScrollable: true,
        controller: widget.tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectedColor,
        unselectedLabelStyle: unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}
