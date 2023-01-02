
class HistoryModel {
  String? user_id;
  String? history_id;
  String? date;
  double? bmi;
  String? resultCategory;

  HistoryModel(this.user_id, this.date, this.bmi, this.resultCategory);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'date': date,
      'bmi': bmi,
      'resultCategory': resultCategory
    };
    return map;
  }

  HistoryModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    date = map['date'];
    bmi = map['bmi'];
    resultCategory = map['resultCategory'];
  }

}
