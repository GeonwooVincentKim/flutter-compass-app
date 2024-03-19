import 'package:flutter/material.dart';

void main() => runApp(myCompassApp());

class myCompassApp extends StatelessWidget {
  const myCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Compass",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        '/': (context) => Splash(),
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
    return const Placeholder();
  }
}