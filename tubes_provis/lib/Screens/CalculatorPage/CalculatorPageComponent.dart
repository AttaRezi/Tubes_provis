import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_provis/Screens/CalculatorPage/CalculateChangeNotifier.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/CalculatorPage/IconButtonAction.dart';
import 'package:tubes_provis/Screens/CalculatorPage/CalculateBMI.dart';

enum Gender { male, female }

class CalculatorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Calculator();
  }

}

class Calculator extends State<CalculatorPage>{
  late Gender selectedGender;
  int height = 150;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

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

        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15,),
                        Container(
                            decoration: BoxDecoration(
                                color: kPink,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: kPink)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                              child: Text("    BMI Calculator   ", style: TextStyle(color: Colors.white),),
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              color: kPinkMuda,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kPinkMuda)
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedGender = Gender.male;
                                          });
                                        },
                                        child: Icon(Icons.male, color: Colors.white),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(20),
                                          backgroundColor: kHijau, // <-- Button color
                                          foregroundColor: Colors.red, // <-- Splash color
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedGender = Gender.female;
                                          });
                                        },
                                        child: Icon(Icons.female, color: Colors.white),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(20),
                                          backgroundColor: kHijau, // <-- Button color
                                          foregroundColor: Colors.red, // <-- Splash color
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  Text("GENDER", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                ],
                              )),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              color: kPinkMuda,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kPinkMuda)
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                              child: Column(
                                children: [
                                  Text("HEIGHT", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        height.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'cm',
                                        style: TextStyle(
                                          color: Color(0xFF8D8E98),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      inactiveTrackColor: Color(0xFF8D8E98),
                                      activeTrackColor: kHijau,
                                      thumbColor: kHijau,
                                      overlayColor: Color(0x29E83D66),
                                      thumbShape:
                                      RoundSliderThumbShape(enabledThumbRadius: 10.0),
                                      overlayShape:
                                      RoundSliderOverlayShape(overlayRadius: 20.0),
                                    ),
                                    child: Slider(
                                      value: height.toDouble(),
                                      min: 100.0,
                                      max: 220.0,
                                      onChanged: (double newHeight) {
                                        setState(() {
                                          height = newHeight.round();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kPinkMuda,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: kPinkMuda)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("WEIGHT", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                      Text(
                                        weight.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RoundIconButton(
                                            icon: Icons.remove,
                                            onPress: () {
                                              setState(() {
                                                weight--;
                                              });
                                            },
                                          ),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onPress: () {
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  )

                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kPinkMuda,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: kPinkMuda)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("AGE", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                        Text(
                                          age.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RoundIconButton(
                                              icon: Icons.remove,
                                              onPress: () {
                                                setState(() {
                                                  age--;
                                                });
                                              },
                                            ),
                                            RoundIconButton(
                                              icon: Icons.add,
                                              onPress: () {
                                                setState(() {
                                                  age++;
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              // Provider.of<Calculate>(context, listen: true).count(weight, height);
                              context.read<Calculate>().count(weight, height);
                              context.read<Calculate>().getResultCategory();
                              context.read<Calculate>().getColor();
                              context.read<Calculate>().getComment();
                              Navigator.of(context).pushNamed("/result");

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kPink,
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Text(
                                  'CALCULATE',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ]
                    )
                  )
                )
              ]
            )
          )
      )
    );
  }
}

