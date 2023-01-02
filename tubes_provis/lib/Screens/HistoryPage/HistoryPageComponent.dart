import 'package:flutter/material.dart';
import 'package:tubes_provis/Comm/comHelper.dart';
import 'package:tubes_provis/Comm/genTextFormField.dart';
import 'package:tubes_provis/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Model/HistoryModel.dart';
import 'package:tubes_provis/Model/UserModel.dart';
import 'package:tubes_provis/Screens/AuthenticationPage/LoginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DatabaseHandler/DbHelper.dart';

class HistoryPage extends StatefulWidget {
  @override
  History createState() => History();
}

class History extends State<HistoryPage> {

  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  DbHelper dbHelper = DbHelper();
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

    // get list of history from user
    Future<List<HistoryModel>> historyListFuture = dbHelper.getHistoryList(userId!);
    historyListFuture.then((historyList) {
      setState(() {
        this.historyList = historyList;
        this.count = historyList.length;
      });
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
        title: Text('History'),
      ),
      body:  ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" ${this.historyList![index].bmi?.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("${this.historyList![index].resultCategory}", style: TextStyle(color: Colors.grey, fontSize: 13))
                    ],
                  ),
                  Text("${this.historyList![index].date}")
                ],
              )
          );

        },
      ),
    );
  }
}

// return Card(
//   color: Colors.red,
//   elevation: 2.0,
//   child: ListTile(
//     leading: CircleAvatar(
//       backgroundColor: Colors.red,
//       child: Icon(Icons.people),
//     ),
//     title: Text("${this.historyList![index].bmi?.toStringAsFixed(1)}"),
//     subtitle: Text("${this.historyList![index].date}"),
//
//   ),
// );

