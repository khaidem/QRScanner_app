import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qr_scan_app/QRScan/data/model/qr_scan_result.model.dart';
import 'package:qr_scan_app/QRScan/data/model/qr_scan_update.dart';
import 'package:qr_scan_app/core/helper/logger.dart';
import 'package:qr_scan_app/onbaording/data/model/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class QRScanProvider with ChangeNotifier {
  /// ### Qr Scan Result Data
  ///
  Future<QrScanResult> getResult(String id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final extractedUserData =
          json.decode(pref.getString("msg") as String) as Map<String, dynamic>;

      var endpointUrl = 'https://sangaiticket.globizsapp.com/api/ticketviews';

      var requestUrl = '$endpointUrl?id=$id';
      var response = await http.get(
        Uri.parse(requestUrl),
        headers: {"Authorization": extractedUserData['msg']},
      );
      var responseData = json.decode(response.body);

      if (responseData['msg'] == "Invalid params.") {
        throw HttpException(responseData['msg']);
      }
      return QrScanResult.fromJson(json.decode(response.body));
    } catch (error) {
      logger.i(error);
      EasyLoading.showToast(error.toString());
      rethrow;
    }
  }

  ///### Update Ticket Data
  ///
  Future<QrScanUpdate> getUpdate(String id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final extractedUserData =
          json.decode(pref.getString("msg") as String) as Map<String, dynamic>;

      var url = "https://sangaiticket.globizsapp.com/api/ticketupdates";

      var requestUrl = '$url?id=$id';
      var response = await http.get(
        Uri.parse(requestUrl),
        headers: {"Authorization": extractedUserData['msg']},
      );
      var d = json.decode(response.body);
      logger.wtf(d);
      return QrScanUpdate.fromJson(
        json.decode(response.body),
      );
    } catch (error) {
      logger.i(error);
      rethrow;
    }
  }
}
