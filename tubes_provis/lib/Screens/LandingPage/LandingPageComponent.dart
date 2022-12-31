import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';
import 'package:tubes_provis/Screens/AboutPage/body_about.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
              'assets/images/bmi_logo.png',
          ),

          Text(
            "BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),

          SizedBox(height: 60),

          Container(
            width: 276,
            height: 58,
            margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/sign_up");
                },
                child: Text("   Sign Up   "),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color: kPink
                    ),
                    backgroundColor: kPink,
                    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39.0)
                    )
                ),
              ),
          ),
          
          Container(
            width: 276,
            height: 58,

            child: ElevatedButton(
              onPressed: (){
                    Navigator.of(context).pushNamed("/home");
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //   return HomePage();
                // }));
              },
              child: Text("   Sign In   "),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 1.0,
                    color: kPink
                  ),
                  foregroundColor: kPink,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39.0)
                  )
              ),
            ),
          )

        ],
      ),
    );
  }
}