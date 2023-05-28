import 'package:flutter/material.dart';

import '../../../data_source/API.dart';
import '../../../models/subject_entity.dart';

class TabContainer extends StatefulWidget {
  final String name;

  const TabContainer({Key? key, required this.name}) : super(key: key);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  List<Subject> list = [];
  String? name;
  var api = API();

  @override
  void initState() {
    super.initState();

    fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.name == 'Tab1' ? Colors.green : Colors.yellow);
  }

  void fetchAllMovies() {
    api.fetchFirst50Moveis();
  }
}
