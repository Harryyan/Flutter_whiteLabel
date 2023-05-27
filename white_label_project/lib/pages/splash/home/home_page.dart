import 'package:flutter/material.dart';
import 'package:white_label_project/pages/splash/home/tab_container.dart';

import '../../../widgets/search_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabs = <String>['Tab1', 'Tab2'];
  final Map<String, IconData> _icons = {
    'Tab1': Icons.home,
    'Tab2': Icons.supervised_user_circle
  };

  @override
  Widget build(BuildContext context) {
    return getTabController();
  }

  DefaultTabController getTabController() {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                expandedHeight: 120.0,
                primary: true,
                titleSpacing: 0.0,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.blue,
                    alignment: const Alignment(0.0, 0.0),
                    child: SearchTextFieldWidget(
                      hintText: 'Search Placeholder...',
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 30.0),
                      onTab: () {
                        // MyRouter.push(context, MyRouter.searchPage, '...');
                      },
                    ),
                  ),
                ),
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    tabs: _tabs
                        .map((name) => Tab(
                              text: name,
                              icon: Icon(_icons[name] as IconData),
                            ))
                        .toList()),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _tabs.map((String name) {
            return TabContainer(
              name: name,
            );
          }).toList(),
        ),
      ),
    );
  }
}
