// To parse this JSON data, do
//
//     final qrScanResult = qrScanResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QrScanResult qrScanResultFromJson(String str) =>
    QrScanResult.fromJson(json.decode(str));

String qrScanResultToJson(QrScanResult data) => json.encode(data.toJson());

class QrScanResult {
  QrScanResult({
    required this.name,
    required this.gender,
    required this.age,
    required this.checked,
  });

  final String name;
  final String gender;
  final int age;
  final bool checked;

  factory QrScanResult.fromJson(Map<String, dynamic> json) => QrScanResult(
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "age": age,
        "checked": checked,
      };
}
