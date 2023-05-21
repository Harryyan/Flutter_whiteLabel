import 'package:flutter/material.dart';

class SplashWidge extends StatefulWidget {
  const SplashWidge({super.key});

  @override
  State<SplashWidge> createState() => _SplashWidgeState();
}

class _SplashWidgeState extends State<SplashWidge> {
  bool showAds = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('Splash Init...');
    return Stack(
      children: <Widget>[
        Offstage(offstage: showAds, child: Container()),
        Offstage(
          child: Container(),
        )
      ],
    );
  }
}
