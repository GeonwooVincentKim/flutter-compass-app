import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Container();
  }
}