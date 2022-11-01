// To parse this JSON data, do
//
//     final qrScanResult = qrScanResultFromJson(jsonString);

import 'dart:convert';

QrScanResult qrScanResultFromJson(String str) =>
    QrScanResult.fromJson(json.decode(str));

String qrScanResultToJson(QrScanResult data) => json.encode(data.toJson());

class QrScanResult {
  QrScanResult({
    required this.name,
    required this.idType,
    required this.idNo,
    required this.checked,
  });

  final String name;
  final String idType;
  final String idNo;
  final bool checked;

  factory QrScanResult.fromJson(Map<String, dynamic> json) => QrScanResult(
        name: json["name"],
        idType: json["id_type"],
        idNo: json["id_no"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id_type": idType,
        "id_no": idNo,
        "checked": checked,
      };
}
