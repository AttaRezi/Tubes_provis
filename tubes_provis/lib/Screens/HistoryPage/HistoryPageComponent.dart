import 'package:flutter/material.dart';
import 'package:tubes_provis/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Model/HistoryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HistoryPage extends StatefulWidget {
  @override
  History createState() => History();
}

class History extends State<HistoryPage> {

  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  DbHelper dbHelper = DbHelper();   // inisialisasi class DbHelper
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

    // get user id from the current user that login
    userId = sp.getString("user_id");

    // get list of history from user login
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
          title: const Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back_ios),
            color: Colors.black,
          )
      ),
      body:  ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.only(left: 50, top: 20, right: 50),

              decoration: BoxDecoration(
                  color: const Color(0xffdff3f4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.transparent),
              ),
              child: Wrap(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${this.historyList![index].bmi?.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  Text("${this.historyList![index].resultCategory}", style: TextStyle(color: Colors.grey, fontSize: 13)),
                                ],
                              ),
                              Text("${this.historyList![index].date}"),
                            ]
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}

