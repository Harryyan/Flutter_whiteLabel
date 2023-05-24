import 'package:flutter/material.dart';
import 'package:white_label_project/pages/splash/splash_widget.dart';

void main() {
  runApp(const WhiteLabelApp());
}

class WhiteLabelApp extends StatelessWidget {
  const WhiteLabelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Scaffold(body: SplashWidget()));
  }
}
