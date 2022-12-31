import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 60,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Create your account\n",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  inputFile(label: "Username"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obsecureText: true),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      children: [
                        TextSpan(text: '\nAlready have an account? ',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Sign In',
                            style: TextStyle(
                                fontSize: 13,
                                color: const Color(0xff59C3C3),
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){Navigator.of(context).pushNamed("/about");}
                        ),
                      ]
                  ),
                ),
              ),

              Container(
                width: 276,
                height: 58,
                margin: EdgeInsets.symmetric(vertical: 20),

                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed("/");
                  },
                  child: Text("Create account"),
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label, obsecureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color:Colors.black87
      ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsecureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 15, width: 50),
    ],
  );
}