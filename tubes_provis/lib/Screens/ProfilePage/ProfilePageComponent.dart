import 'package:flutter/material.dart';
import 'package:tubes_provis/Comm/comHelper.dart';
import 'package:tubes_provis/Comm/genTextFormField.dart';
import 'package:tubes_provis/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Model/UserModel.dart';
import 'package:tubes_provis/Screens/AuthenticationPage/LoginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_provis/constants.dart';

import '../../DatabaseHandler/DbHelper.dart';

class ProfilePage extends StatefulWidget {
  @override
  Profile createState() => Profile();
}

class Profile extends State<ProfilePage> {

  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  DbHelper dbHelper = DbHelper();
  final _UserId = TextEditingController();
  final _UserName = TextEditingController();
  final _Email = TextEditingController();
  final _Password = TextEditingController();
  String? userId;
  String? userEmail;


  @override
  void initState() {
    super.initState();
    getUserData();

    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    userId = sp.getString("user_id");
    userEmail = sp.getString("email");
    print(userId);
    print(userEmail);

    setState(() {
      _UserId.text = sp.getString("user_id");
      _UserName.text = sp.getString("user_name");
      _Email.text = sp.getString("email");
      _Password.text = sp.getString("password");
    });

  }

  update() async {
    String uid = _UserId.text;
    String uname = _UserName.text;
    String email = _Email.text;
    String passwd = _Password.text;

      UserModel user = UserModel(uid, uname, email, passwd);
      await dbHelper!.updateUser(user).then((value) {
        if (value == 1) {
          print("keupdate");
          alertDialog(context, "Successfully Updated");

          updateSP(user, true).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginForm()),
                    (Route<dynamic> route) => false);
          });
        } else {
          print("ga update");
          alertDialog(context, "Error Update");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error");
      });
  }

  Future updateSP(UserModel user, bool add) async {
    final SharedPreferences sp = await _pref;

    if (add) {
      sp.setString("user_name", user.user_name);
      sp.setString("email", user.email);
      sp.setString("password", user.password);
    } else {
      sp.remove('user_id');
      sp.remove('user_name');
      sp.remove('email');
      sp.remove('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline1;
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: kPink,
        elevation: 0,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Icon(Icons.person, size: 100, color: Colors.black),
              ),
            Center(
              child: Column(
                children: [
                  Text(
                    '$userId',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$userEmail',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),),
            getTextFormField(
                controller: _UserId,
                isEnable: false,
                icon: Icons.person,
                hintName: 'User ID'),
            SizedBox(height: 20.0),
            getTextFormField(
                controller: _UserName,
                icon: Icons.person_outline,
                inputType: TextInputType.name,
                hintName: 'User Name'),
            SizedBox(height: 20.0),
            getTextFormField(
                controller: _Email,
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                hintName: 'Email'),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                child: Text(
                  'Update',
                  style: TextStyle(
                      color: Colors.white),
                ),
                onPressed: update,
              ),
            ),
          ],
        ),
      )
    );
  }


}