import 'package:flutter/material.dart';
import 'package:tubes_provis/Comm/comHelper.dart';
import 'package:tubes_provis/Comm/genLoginSignupHeader.dart';
import 'package:tubes_provis/Comm/genTextFormField.dart';
import 'package:tubes_provis/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Model/UserModel.dart';
import 'package:tubes_provis/Screens/AuthenticationPage/SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_provis/Screens/HomePage/HomePageComponent.dart';
import 'package:tubes_provis/constants.dart';
import 'package:flutter/gestures.dart';

import 'HomeForm.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id);
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Sign In'),
                getTextFormField(
                    controller: _conUserId,
                    icon: Icons.person,
                    hintName: 'User ID'),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: login,

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
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        children: [
                          TextSpan(text: 'Does not have an account? ',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Sign Up',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: const Color(0xff59C3C3),
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){Navigator.of(context).pushNamed("/sign_up");}
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
