import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';

class BlogTopicPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Blog",
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
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff45b3cb),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.transparent)
                              ),
                              padding: EdgeInsets.all(20),
                              child:
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                              Icons.tips_and_updates_sharp,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                        ),
                                        TextSpan(text:
                                        '\n'
                                            'Tips and Tricks',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '\n'),
                                        TextSpan(text: '1 articles                                                                                    ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ]
                                  )
                              ),
                            ),
                              onTap: (){Navigator.of(context).pushNamed("/blogtopic1");}
                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            child: Container(
                                  decoration: BoxDecoration(
                                  color: const Color(0xffed7390),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.transparent)
                              ),
                              padding: EdgeInsets.all(20),
                              child:
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                              Icons.health_and_safety,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                        ),
                                        TextSpan(text:
                                        '\n'
                                            'Healthy Life',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '\n'),
                                        TextSpan(text: '1 articles                                                                                    ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ]
                                  )
                              ),
                            ),
                              onTap: (){Navigator.of(context).pushNamed("/blogtopic2");}
                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffe59850),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.transparent)
                              ),
                              padding: EdgeInsets.all(20),
                              child:
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                              Icons.food_bank,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                        ),
                                        TextSpan(text:
                                        '\n'
                                            'Healthy Food',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '\n'),
                                        TextSpan(text: '1 articles                                                                                    ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ]
                                  )
                              ),
                            ),
                              onTap: (){Navigator.of(context).pushNamed("/blogtopic3");}
                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff45b3cb),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.transparent)
                              ),
                              padding: EdgeInsets.all(20),
                              child:
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                              Icons.sports_gymnastics,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                        ),
                                        TextSpan(text:
                                        '\n'
                                            'Sport',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '\n'),
                                        TextSpan(text: '1 articles                                                                                    ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ]
                                  )
                              ),
                            ),
                              onTap: (){Navigator.of(context).pushNamed("/blogtopic4");}
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