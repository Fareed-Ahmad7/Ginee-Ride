import 'package:flutter/material.dart';
import 'package:ginee/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ginee App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home screen widget
      home: const HomeScreen(),
    );
  }
}

