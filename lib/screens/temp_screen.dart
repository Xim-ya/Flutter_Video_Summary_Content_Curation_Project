import 'dart:convert';

List<Sample> sampleFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Sample>.from(jsonData.map((x) => Sample.fromJson(x)));
}

String sampleToJson(List<Sample> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Sample {
  String empPayslipsId;
  String month;
  String description;
  String paymentPeriod;
  String lastAccessBy;
  String lastAccessDate;
  String lastAccessTime;
  String successAccess;
  String failAccess;

  Sample({
    required this.empPayslipsId,
    required this.month,
    required this.description,
    required this.paymentPeriod,
    required this.lastAccessBy,
    required this.lastAccessDate,
    required this.lastAccessTime,
    required this.successAccess,
    required this.failAccess,
  });

  factory Sample.fromJson(Map<String, dynamic> json) => new Sample(
        empPayslipsId: json["empPayslipsId"],
        month: json["month"],
        description: json["description"],
        paymentPeriod: json["paymentPeriod"],
        lastAccessBy: json["lastAccessBy"],
        lastAccessDate: json["lastAccessDate"],
        lastAccessTime: json["lastAccessTime"],
        successAccess: json["successAccess"],
        failAccess: json["failAccess"],
      );

  Map<String, dynamic> toJson() => {
        "empPayslipsId": empPayslipsId,
        "month": month,
        "description": description,
        "paymentPeriod": paymentPeriod,
        "lastAccessBy": lastAccessBy,
        "lastAccessDate": lastAccessDate,
        "lastAccessTime": lastAccessTime,
        "successAccess": successAccess,
        "failAccess": failAccess,
      };
}
