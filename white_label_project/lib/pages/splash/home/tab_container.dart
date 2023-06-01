import 'package:flutter/material.dart';
import 'package:white_label_project/models/home_entity.dart';

import '../../../data_source/API.dart';
import '../../../data_source/mock_request.dart';
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

    if (list.isEmpty) {
      fetchAllMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.name == 'Tab1' ? Colors.green : Colors.yellow);
  }

  void fetchAllMovies() async {
    var request = MockRequest();
    var result = await request.get(API.TOP_250);
    var resultList = result['subjects'];
    list = resultList.map<Movie>((item) => Movie.fromMap(item)).toList();

    setState(() {});
  }
}
