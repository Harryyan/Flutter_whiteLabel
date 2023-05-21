import 'package:flutter/material.dart';

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
        home: Scaffold(body: Container()));
  }
}
