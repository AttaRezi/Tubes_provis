import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/AboutPage/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tubes Provis',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kPink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AboutPage(),
    );
  }
}

