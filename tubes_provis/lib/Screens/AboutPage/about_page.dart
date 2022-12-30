import 'package:flutter/material.dart';
import 'package:tubes_provis/Screens/AboutPage/body_about.dart';
import 'package:tubes_provis/constants.dart';

class AboutPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPink,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back_ios),
          )
      ),
      body: About(),
    );
  }
}

