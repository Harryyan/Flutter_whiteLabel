import 'package:flutter/material.dart';

import '../../../widgets/search_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabs = <String>['Tab1', 'Tab2'];
  final Map<String, IconData> _icons = const {
    'Tab1': Icons.home,
    'Tab2': Icons.hotel
  };

  @override
  Widget build(BuildContext context) {
    return getTabController();
  }

  DefaultTabController getTabController() {
    return DefaultTabController(
      initialIndex: 1,
      length: _tabs.length, // This is the number of tabs.
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
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
                    child: SearchTextFieldWidget(
                      hintText: 'Search Placeholder...',
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 30.0),
                      onTab: () {
                        // MyRouter.push(context, MyRouter.searchPage, '影视作品中你难忘的离别');
                      },
                    ),
                    alignment: const Alignment(0.0, 0.0),
                  ),
                ),
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    tabs: _tabs
                        // .map((String name) => Container(
                        //       child: Text(
                        //         name,
                        //       ),
                        //       padding: const EdgeInsets.only(bottom: 5.0),
                        //     ))
                        // .toList(),
                        .map((name) => Tab(
                              text: name,
                              icon: Icon(_icons[name]),
                            ))
                        .toList()),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _tabs.map((String name) {
            return Container();
          }).toList(),
        ),
      ),
    );
  }
}
