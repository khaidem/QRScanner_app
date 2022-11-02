import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_scan_app/core/helper/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService with ChangeNotifier {
  String? _msg;
  String? _status;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_msg != null || _status != null) {
      return _msg;
    }
    return null;
  }

  /// ### This will work For Login
  ///

  Future<void> login(String username, String password) async {
    final url =
        Uri.parse('https://sangaiticket.globizsapp.com/api/sitelogins/login');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "username": username,
            "password": password,
          },
        ),
      );
      final responseData = jsonDecode(response.body);

      logger.d(responseData);
      final pref = await SharedPreferences.getInstance();
      _msg = responseData["msg"];
      final storeData = json.encode({"msg": _msg.toString()});
      pref.setString("msg", storeData);
      logger.v('SharePref $storeData');
    } catch (error) {
      rethrow;
    }
  }

  /// ### This will work for usr
  Future<bool> tryAutoLogin() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey("msg")) {
      return false;
    }
    final extractedUserData =
        json.decode(pref.getString("msg") as String) as Map<String, dynamic>;
    // final extractedUserData = json.decode(pref.getString('msg') as String);

    if (extractedUserData.isEmpty) {
      return false;
    }
    _msg = extractedUserData["msg"] as String;
    notifyListeners();
    return true;
  }

  Future<void> logOut() async {
    _msg = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    logger.e(prefs);
    prefs.clear();
  }
}
