import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NewSplash extends StatefulWidget {
  const NewSplash({super.key});

  @override
  State<NewSplash> createState() => _NewSplashState();
}

class _NewSplashState extends State<NewSplash> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isAnimationDone = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc)
    );

    if (!isAnimationDone) {
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkAnimationDone()
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController.dispose();

    super.dispose();
  }

  Future checkAnimationDone() async {
    print("Check Status -> $isAnimationDone");

    setState(() {
      print("Check Status (setState) -> $isAnimationDone");
      isAnimationDone = true;
    });

    print("Check Status (setState Out) -> $isAnimationDone");

    if (isAnimationDone) {
      timer?.cancel();
      
      setState(() {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Splash test"),
      centerTitle: true,
    ),
    body: Center(
      child: Lottie.asset('assets/json/lottie.json'),
    )
  );
}