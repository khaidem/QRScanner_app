import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black));

  runApp(const MyApp());
}
