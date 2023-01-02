import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';

class BlogTopic1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Blog Topic 1",
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
                Align(
                  alignment: Alignment.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                  // width: MediaQuery.of(context).size.width * 1.0,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Container(
                                decoration: BoxDecoration(
                                    color: kPinkMuda,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.transparent)
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Tips and Tricks", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: 20)),
                                    Text("How to Lower your BMI", style: TextStyle(color: Colors.black, fontSize: 18)),
                                    SizedBox(height: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Don't bother with crash diet", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(height: 5,),
                                        Text("‘quick fix’ diets do not work for the longer term, and are certainly not the best way to lower your BMI. A balanced, calorie-controlled diet is the ticket to a healthy BMI – the safe way. By making simple healthier food swaps, reducing portion sizes and cutting down on high-calorie food and drink, you’re more likely to reach a healthy BMI steadily, and keep the extra weight off.", maxLines: 15,
                                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Look out for hidden sugar", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(height: 5,),
                                        Text("The government recommends that adults should have no more than 30g of sugar a day (roughly equivalent to 7 sugar cubes), children aged 7 to 10 should have no more than 24g of free sugars a day (6 sugar cubes), and children aged 4 to 6 should have no more than 19g of free sugars a day (5 sugar cubes).", maxLines: 10,
                                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Get your heart pumping", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(height: 5,),
                                        Text("NHS recommends doing at least 150 minutes of moderate intensity exercise a week (for example a brisk walk, hiking or cycling), or 75 minutes’ vigorous intensity. You should mix up cardio and strength training to strengthen key muscles and achieve better weight loss results.", maxLines: 10,
                                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                      ],
                                    ),
                                  ]
                                )
                          )
                        ]
                      )
                      ),
                ),
            ]
            )
          )
        )
    );
  }
}