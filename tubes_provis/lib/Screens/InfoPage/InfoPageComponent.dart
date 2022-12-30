import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';

class InfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
              "Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: kPink,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:Icon(Icons.arrow_back_ios),
            )
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, top: 60.0, right: 20.0, bottom: 0),
                  child: Text(
                    "Classification of\nWeigh Status",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,

                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 15,),
                        Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffdff3f3),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)
                            ),
                            padding: EdgeInsets.all(20),
                            child:
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'UNDERWEIGHT',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '\n'),
                                    TextSpan(text: 'Where your Body Mass Index (BMI)            '),
                                    TextSpan(text: '<18.5 Kg/m2', style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                                  ]
                                )
                              ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffdff3f3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)
                          ),
                          padding: EdgeInsets.all(20),
                          child:
                          Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(text: 'NORMAL',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '\n'),
                                    TextSpan(text: 'Where your Body Mass Index (BMI)  '),
                                    TextSpan(text: '18.5-24.9 Kg/m2', style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                                  ]
                              )
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffdff3f3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)
                          ),
                          padding: EdgeInsets.all(20),
                          child:
                          Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(text: 'OVERWEIGHT',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '\n'),
                                    TextSpan(text: 'Where your Body Mass Index (BMI)  '),
                                    TextSpan(text: '25.0-29.9 Kg/m2', style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                                  ]
                              )
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffdff3f3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)
                          ),
                          padding: EdgeInsets.all(20),
                          child:
                          Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(text: 'OBESE',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '\n'),
                                    TextSpan(text: 'Where your Body Mass Index (BMI)                '),
                                    TextSpan(text: '>30 Kg/m2', style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                                  ]
                              )
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}