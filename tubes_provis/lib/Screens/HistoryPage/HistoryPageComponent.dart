import 'package:flutter/material.dart';
import 'package:tubes_provis/Comm/comHelper.dart';
import 'package:tubes_provis/Comm/genTextFormField.dart';
import 'package:tubes_provis/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Model/HistoryModel.dart';
import 'package:tubes_provis/Model/UserModel.dart';
import 'package:tubes_provis/Screens/AuthenticationPage/LoginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DatabaseHandler/DbHelperHistory.dart';

class HistoryPage extends StatefulWidget {
  @override
  History createState() => History();
}

class History extends State<HistoryPage> {

  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  DbHelperHistory dbHelper = DbHelperHistory();
  int count = 0;
  List<HistoryModel>? historyList;
  String? userId;


  @override
  void initState() {
    super.initState();
    getUserData();

  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    userId = sp.getString("user_id");
    print(userId);

    await dbHelper.getHistoryList(userId!).then((userData) {
      if (userData != null) {

          historyList = historyList;
          count = historyList!.length;

      } else {
        alertDialog(context, "Error: History Not Found");
      }
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: Fail");
    });

  }

  @override
  Widget build(BuildContext context) {

    if (historyList == null) {
      historyList = <HistoryModel>[];
    }
    TextStyle? textStyle = Theme.of(context).textTheme.headline1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
                        ListView.builder(
                          itemCount: count,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colors.white,
                              elevation: 2.0,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.people),
                                ),
                                title: Text("${this.historyList![index].bmi}"),
                                subtitle: Text("${this.historyList![index].date}"),

                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20,),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      )

      // body: ListView.builder(
      //   itemCount: count,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Card(
      //       color: Colors.white,
      //       elevation: 2.0,
      //       child: ListTile(
      //         leading: CircleAvatar(
      //           backgroundColor: Colors.red,
      //           child: Icon(Icons.people),
      //         ),
      //         title: Text(this.historyList[index].name, style: textStyle,),
      //         subtitle: Text(this.historyList[index].phone),
      //
      //         onTap: () async {
      //           var contact = await navigateToEntryForm(context, this.contactList[index]);
      //           if (contact != null) editContact(contact);
      //         },
      //       ),
      //     );
      //   },
      // );
    );
  }
}

// void addContact() async {
//   int result = await dbHelper.insert();
//   if (result > 0) {
//     updateListView();
//   }
// }
//
// void updateListView() {
//
//   Future<List<HistoryModel>> contactListFuture = dbHelper.getContactList();
//   contactListFuture.then((contactList) {
//     setState(() {
//       this.contactList = contactList;
//       this.count = contactList.length;
//     });
//   });
// }