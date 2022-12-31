import 'dart:developer';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:tubes_provis/Screens/ResultPage/ResultPageComponent.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/LandingPage/LandingPageComponent.dart';
import 'package:tubes_provis/Screens/HomePage/HomePageComponent.dart';
import 'package:tubes_provis/Screens/AboutPage/body_about.dart';
import 'package:tubes_provis/Screens/AboutPage/about_page.dart';
import 'package:tubes_provis/Screens/InfoPage/InfoPageComponent.dart';
import 'package:tubes_provis/Screens/BlogTopicPage/BlogTopic.dart';
import 'package:tubes_provis/Screens/CalculatorPage/CalculatorPageComponent.dart';
import 'package:tubes_provis/Screens/CalculatorPage/CalculateChangeNotifier.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Calculate(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMIXpert - UAS Provis',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: kPink,
          scaffoldBackgroundColor: Colors.white,
        ),

        initialRoute: "/",
        routes: {
          '/' : (context) => MyHomePage(),
          '/about' : (context) => AboutPage(),
          '/home' : (contex) => HomePage(),
          '/info' : (contex) => InfoPage(),
          '/blog_topic' : (contex) => BlogTopicPage(),
          '/calculator' : (contex) => CalculatorPage(),
          '/result' : (contex) => ResultPage(),
        },
      )
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //
      //   title: Text(widget.title),
      // ),
      body: LandingPage()
    );
  }
}
