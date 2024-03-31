import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_compass_app/new_splash.dart';
import 'package:flutter_compass_app/splash.dart';

void main() => runApp(myCompassApp());

class myCompassApp extends StatelessWidget {
  const myCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: "Compass",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => NewSplash(),
        // '/': (context) => Splash(),
        '/home': (context) => Home(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? heading = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text("Compass App"),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${heading!.ceil()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold
          )
        ),
        const SizedBox(height: 50.0),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/pngegg.png"),
              Transform.rotate(
                angle: ((heading ?? 0) * (pi / 180) * -1),
                child: Image.asset(
                  "assets/images/compass.png",
                  scale: 1.1
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}