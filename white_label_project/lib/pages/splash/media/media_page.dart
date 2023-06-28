import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
