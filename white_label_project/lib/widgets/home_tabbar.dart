import "package:flutter/material.dart";

class HomePageTabBar extends StatefulWidget {
  const HomePageTabBar({super.key});

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
  Widget build(BuildContext context) {
    return Container();
  }
}
