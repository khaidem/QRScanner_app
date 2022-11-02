// To parse this JSON data, do
//
//     final qrScanUpdate = qrScanUpdateFromJson(jsonString);

import 'dart:convert';

QrScanUpdate qrScanUpdateFromJson(String str) =>
    QrScanUpdate.fromJson(json.decode(str));

String qrScanUpdateToJson(QrScanUpdate data) => json.encode(data.toJson());

class QrScanUpdate {
  QrScanUpdate({
    required this.msg,
  });

  final String msg;

  factory QrScanUpdate.fromJson(Map<String, dynamic> json) => QrScanUpdate(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
