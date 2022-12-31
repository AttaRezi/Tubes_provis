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
                // width: MediaQuery.of(context).size.width * 0.7,
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
                            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 120),
                            child: Column(
                              children: [
                                Consumer<Calculate>(
                                  builder: (context, calculate, child) =>  Text(
                                    '${calculate.bmi.toStringAsFixed(1)}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Your BMI", style: TextStyle(color: Colors.black, fontSize: 15),),
                                SizedBox(height: 10,),
                                Consumer<Calculate>(
                                  builder: (context, calculate, child) =>  Text(
                                    '${calculate.resultCategory}',
                                    style: TextStyle(
                                      color: calculate.colors,
                                      fontSize: 20,
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
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPink,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text(
                          'RE CALCULATE',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed("/info");
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPink,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                            'DETAIL',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      )

    );
  }
}
