import 'package:flutter/material.dart';
import 'package:white_label_project/pages/splash/splash_widget.dart';

import 'helpers/material_color_generator.dart';

void main() {
  runApp(const WhiteLabelApp());
}

class WhiteLabelApp extends StatelessWidget {
  const WhiteLabelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.lightBlue[800]),
        home: const Scaffold(body: SplashWidget()));
  }
}
