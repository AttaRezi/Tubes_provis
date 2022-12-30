import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/HomePage/HeaderShape.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kPink,
      //   //title: Text(widget.title),
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: kPink),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage("http://medialengka.com/profile.jpg"),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 20),
                  Text("username",
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
                onTap: (){Navigator.of(context).pushNamed("/");}
            ),
            ListTile(
                leading: const Icon(Icons.calculate),
                title: Text("BMI Calculator"),
                onTap: (){Navigator.of(context).pushNamed("/");}
            ),
            ListTile(
                leading: const Icon(Icons.text_snippet_outlined),
                title: Text("Information"),
                onTap: (){Navigator.of(context).pushNamed("/info");}
            ),
            ListTile(
                leading: const Icon(Icons.article_sharp),
                title: Text("Blog"),
                onTap: (){Navigator.of(context).pushNamed("/");}
            ),
            ListTile(
                leading: const Icon(Icons.info),
                title: Text("About"),
                onTap: (){Navigator.of(context).pushNamed("/about");}
            ),
            ListTile(
                leading: const Icon(Icons.help),
                title: Text("Help"),
                onTap: (){Navigator.of(context).pushNamed("/");}
            ),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.logout),
                            title: Text('Log out'))
                      ],
                    ))),
          ],
        ),
      ),
        body: Container(
          // child: Text("Haloooo"),
            child: CustomPaint(
              painter: SquareWithRoundedCornerPainter(),
              // child: Text('Hello World'),
              )
        )
    );
  }
}