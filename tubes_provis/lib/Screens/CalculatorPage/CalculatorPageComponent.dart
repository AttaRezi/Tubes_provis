import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_provis/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Screens/CalculatorPage/CalculateChangeNotifier.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/CalculatorPage/IconButtonAction.dart';
import 'package:tubes_provis/Model/HistoryModel.dart';
import 'package:intl/intl.dart';


import '../../Comm/comHelper.dart';


enum Gender { male, female }

class CalculatorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Calculator();
  }

}

class Calculator extends State<CalculatorPage> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  late Gender selectedGender;
  int height = 150;
  int weight = 50;
  int age = 20;
  TextEditingController dateController = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dateController.text = ""; //set the initial value of text field
    dbHelper = DbHelper(); // inisialisasi class DbHelper
  }

  savetoDb() async { //called when calculate button pressed

    final SharedPreferences sp = await _pref;

    String? date;
    double? bmi;
    String? resultCategory;

    // get bmi data from state management provider
    date = context.read<Calculate>().date;
    bmi = context.read<Calculate>().bmi;
    resultCategory = context.read<Calculate>().resultCategory;

    // get user id that currently login
    String uid = sp.getString("user_id");

    // Instantiation object form historymodel class
    HistoryModel hModel = HistoryModel(uid, date, bmi, resultCategory);

    // check if user have a history with column date the same as input date
    await dbHelper.getHistoryUser(uid, date).then((userData){
      if (userData != null) {
          // have history with current date, do update
        print("add update");
        dbHelper.updateHistory(hModel).then((value) {
          if (value == 1) {
            alertDialog(context, "Successfully Updated");
          } else {
            alertDialog(context, "Error Update");
          }
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error");
        });
      } else {
         // else, do insert new history with current date
        dbHelper.insertDataHistory(hModel).then((userDataHistory) {
          alertDialog(context, "Successfully Saved");
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: Data Save Fail");
        });
      }
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: Add Fail");
    });

  }


  @override
  Widget build(BuildContext context) {

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
                  width: MediaQuery.of(context).size.width * 0.8,
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
                                TextField(

                                  controller: dateController, //editing controller of this TextField
                                  decoration: const InputDecoration(

                                      icon: Icon(Icons.calendar_today),
                                      labelText: "Enter Date"
                                  ),
                                  readOnly: true,  // when true user cannot edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101)
                                    );

                                    if(pickedDate != null ){

                                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // change format date
                                      print(formattedDate); //formatted date output using intl package =>  2022-07-04

                                      setState(() {
                                        dateController.text = formattedDate; //set formatted date to TextField value.
                                      });
                                    }else{
                                      print("Date is not selected");
                                    }
                                  },
                                )
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

                              savetoDb(); // call func to save input data to db

                              // call func in ChangeNotifier class
                              context.read<Calculate>().count(weight, height);
                              context.read<Calculate>().addDate(dateController.text);
                              context.read<Calculate>().getResultCategory();
                              context.read<Calculate>().getColor();

                              // go to result page
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

