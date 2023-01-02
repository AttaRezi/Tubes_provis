import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/HomePage/HeaderShape.dart';

class HomePage extends StatefulWidget {
  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String? userId;

  @override
  void initState() {
    super.initState();
    getUserData();

  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    userId = sp.getString("user_id");
  }


  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPink,
        //title: Text(widget.title),
      ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: kPink),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.person, size: 60, color: Colors.white,),

                    SizedBox(width: 20),
                    Text("${userId}",
                        style: TextStyle(fontSize: 15, color: Colors.white)
                    )
                  ],
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.house),
                  title: Text("Home"),
                  onTap: (){Navigator.of(context).pushNamed("/home");}
              ),
              ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: Text("Profile"),
                  onTap: (){Navigator.of(context).pushNamed("/profile");}
              ),
              ListTile(
                  leading: const Icon(Icons.calculate),
                  title: Text("BMI Calculator"),
                  onTap: (){Navigator.of(context).pushNamed("/calculator");}
              ),
              ListTile(
                  leading: const Icon(Icons.text_snippet_outlined),
                  title: Text("Information"),
                  onTap: (){Navigator.of(context).pushNamed("/info");}
              ),
              ListTile(
                  leading: const Icon(Icons.article_sharp),
                  title: Text("Blog"),
                  onTap: (){Navigator.of(context).pushNamed("/blog_topic");}
              ),
              ListTile(
                  leading: const Icon(Icons.history_outlined),
                  title: Text("History"),
                  onTap: (){Navigator.of(context).pushNamed("/history");}
              ),
              ListTile(
                  leading: const Icon(Icons.info),
                  title: Text("About"),
                  onTap: (){Navigator.of(context).pushNamed("/about");}
              ),
              ListTile(
                  leading: const Icon(Icons.help),
                  title: Text("Help"),
                  onTap: (){Navigator.of(context).pushNamed("/home");}
              ),
              Container(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Divider(),
                          ListTile(
                              leading: Icon(Icons.logout),
                              title: Text('Log out'),
                              onTap: (){Navigator.of(context).pushNamed("/");}
                          )
                        ],
                      ))),
            ],
          ),
        ),
        body: SingleChildScrollView(
          // child: Text("Haloooo"),
            child: Column(
              children: [
                Stack(
                  children: [
                    Opacity(
                        opacity: 0.5,
                        child: CustomPaint(
                          painter: SquareWithRoundedCornerPainter(),
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 320,
                            color: Colors.white38,

                          ),
                        )
                    ),
                    CustomPaint(
                      painter: SquareWithRoundedCornerPainter(),
                      child: Container(
                        // width: MediaQuery.of(context).size.width,
                        height: 300,
                        // color: Colors.white38,
                        // height:200,

                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 80),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                            child: Text("Hello ${userId}", style: TextStyle(color: Colors.white, fontSize: 20),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffdff3f3),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                              child: Text("Welcome"),
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 60.0, right: 20.0, bottom: 0),
                          child: Text(
                            "What are you looking for?",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                                  InkWell(
                                    child: Container(
                                        width: 500,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffdff3f3),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.transparent)
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child: Wrap(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // const SizedBox(width: 0),
                                            Icon(Icons.calculate_rounded, size: 40, color: Colors.blueAccent),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(" BMI Calculator", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                Text(" Count your body mass index", style: TextStyle(color: Colors.grey, fontSize: 13))
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                    onTap: (){Navigator.of(context).pushNamed("/calculator");}
                                  ),
                                  const SizedBox(height: 15,),
                                  InkWell(
                                    child: Container(
                                        width: 500,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffdff3f3),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.transparent)
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child: Wrap(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // const SizedBox(width: 70),
                                            Icon(Icons.article_outlined, size: 40, color: Colors.blueAccent),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(" Blog", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                Text(" Find out more about BMI  ", style: TextStyle(color: Colors.grey, fontSize: 13))
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                    onTap: (){Navigator.of(context).pushNamed("/blog_topic");}
                                  ),
                                  const SizedBox(height: 100),
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )

        )
    );
  }
}