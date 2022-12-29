import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/LandingPage/LandingPageComponent.dart';
import 'package:tubes_provis/Screens/AboutPage/body_about.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kPink,
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: "/",
      routes: {
        '/' : (context) => MyHomePage(),
        '/about' : (context) => AboutPage(),
      },
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
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //           title: Text("Home"),
      //           onTap: (){Navigator.of(context).pushNamed("/");}
      //       ),
      //       ListTile(
      //           title: Text("Lainnya"),
      //           onTap: (){Navigator.of(context).pushNamed("/lainnya");}
      //       )
      //     ],
      //   ),
      // ),
      body: LandingPage()
    );
  }
}
