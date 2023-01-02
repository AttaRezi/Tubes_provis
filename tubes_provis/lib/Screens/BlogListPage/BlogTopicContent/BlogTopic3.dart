import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';

class BlogTopic3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Blog Topic 3",
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
                                            Text("Healthy Food", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: 20)),
                                            Text("How to Change Your Eating Habits", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 14)),
                                            SizedBox(height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text("Make a Plan for New Healthy Diet", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                                SizedBox(height: 5,),
                                                Text("The first step is to develop a concrete and specific plan of action, says Heller. For instance, tomorrow morning when it’s time to eat breakfast, plan to skip the fast-food breakfast sandwich and eat a piece of whole grain toast with peanut butter at home.", maxLines: 10,
                                                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text("Save Your Lunch Money", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                                SizedBox(height: 5,),
                                                Text("Bringing your lunch to school or work has more than one perk. It’s a good way to save money and use up what you have in the house, and it will likely be more nutritious. One easy way to do that, suggests Heller: Pack leftovers from last night’s dinner.", maxLines: 15,
                                                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black, fontSize: 13),)
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text("Keep Unhealthy Foods Out of Sight", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                                SizedBox(height: 5,),
                                                Text("Purge your pantry and fridge of any unhealthy food, and start thinking about getting only the good stuff into your kitchen. That way, you’ll have more of a chance of eating healthy and much less of a chance of eating junk. Make a shopping list so that you can pick up all the vegetables, fruit, and other plant-based foods that you need for the next three days, says Heller.", maxLines: 15,
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