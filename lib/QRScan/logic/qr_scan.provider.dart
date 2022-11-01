import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_scan_app/QRScan/data/model/qr_scan_result.model.dart';
import 'package:qr_scan_app/core/helper/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class QRScanProvider with ChangeNotifier {
  Future<QrScanResult> getResult(String id) async {
    final pref = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(pref.getString("msg") as String) as Map<String, dynamic>;

    var endpointUrl = 'https://sangaiticket.globizsapp.com/api/ticketviews';
    var url = "https://sangaiticket.globizsapp.com/api/ticketupdates?id=1";

    var requestUrl = '$endpointUrl?id=$id';
    var response = await http.get(
      Uri.parse(requestUrl),
      headers: {"Authorization": extractedUserData['msg']},
    );
    var d = json.decode(response.body);

    logger.d(d);
    return QrScanResult.fromJson(json.decode(response.body));
  }

  Future getUpdate(String id) async {
    final pref = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(pref.getString("msg") as String) as Map<String, dynamic>;

    // var endpointUrl = 'https://sangaiticket.globizsapp.com/api/ticketviews';
    var url = "https://sangaiticket.globizsapp.com/api/ticketupdates?id=1";

    var requestUrl = '$url?id=$id';
    var response = await http.get(
      Uri.parse(requestUrl),
      headers: {"Authorization": extractedUserData['msg']},
    );
    var d = json.decode(response.body);

    logger.wtf(d);
  }
}
