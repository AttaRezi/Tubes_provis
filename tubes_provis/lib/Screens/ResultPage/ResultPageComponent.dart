import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_provis/Screens/CalculatorPage/CalculateChangeNotifier.dart';
import 'package:tubes_provis/constants.dart';
import 'package:provider/provider.dart';


class ResultPage extends StatelessWidget {

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
                width: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15,),
                      Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                            child: Text("    Your Result   ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                          )
                      ),
                      SizedBox(height: 20,),
                      Container(
                          decoration: BoxDecoration(
                              color: kPinkMuda,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kPinkMuda)
                          ),
                        child:  Padding(
                            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                            child: Column(
                              children: [
                                Consumer<Calculate>(
                                  builder: (context, calculate, child) =>  Text(
                                    'Date: ${calculate.date}',
                                    style: TextStyle(
                                      color: kPink,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Consumer<Calculate>(
                                  builder: (context, calculate, child) =>  Text(
                                    '${calculate.bmi.toStringAsFixed(1)}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Your Body Mass Index", style: TextStyle(color: Colors.black, fontSize: 10),),
                                SizedBox(height: 10,),
                                Consumer<Calculate>(
                                  builder: (context, calculate, child) =>  Text(
                                    '${calculate.resultCategory}',
                                    style: TextStyle(
                                      color: calculate.colors,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),

                              ],
                            )
                        ),
                      )
                    ]
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("RE CALCULATE"),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 0.7,
                        color: kPink
                    ),
                    backgroundColor: kPink,
                    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/info");
                },
                child: Text("      DETAILS      "),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 1.7,
                        color: kPink
                    ),
                    backgroundColor: kPink,
                    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/history");
                },
                child: Text("      History      "),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 1.7,
                        color: kPink
                    ),
                    backgroundColor: kPink,
                    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      )

    );
  }
}
