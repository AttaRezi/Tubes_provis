import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';

class BlogTopic4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Blog Topic 4",
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
                                            Text("Sport", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: 20)),
                                            Text("A Guide to a Healthy Lifestyle", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15)),
                                            SizedBox(height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text("A healthy diet", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                                                SizedBox(height: 5,),
                                                Text("A healthy diet involves eating a variety of foods in the correct proportions and consuming a calorie intake that allows for the maintenance of healthy body weight.", maxLines: 10,
                                                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text("Physical activity", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                                                SizedBox(height: 5,),
                                                Text("The World Health Organisation recommends that all adults undertake regular physical activity, including at least thirty minutes of moderate aerobic activity daily, supplemented by at least two weight-bearing activity sessions per week. Being physically fit protects against diseases such as cardiovascular disease, some cancers, diabetes mellitus and osteoporosis and aids in the secondary prevention (i.e., the worsening of symptoms) of such disorders.", maxLines: 15,
                                                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text("Healthy body weight", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                                                SizedBox(height: 5,),
                                                Text("Maintaining healthy body weight is critical for overall health and protects against numerous diseases. Body mass index (BMI), an estimation of body fat calculated using height and weight, can be a useful indicator of whether body weight is healthy. A normal BMI score ranges between 18.5 and 24.9, a score of 25.0 – 29.9 indicates that an individual is overweight, and a score of 30+ indicates obesity. BMI score is positively correlated with disease risk, with higher scores indicating an increased risk of several diseases.", maxLines: 15,
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