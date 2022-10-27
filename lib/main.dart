import 'package:flutter/material.dart';
import 'package:qr_scan_app/router/app_router.gr.dart';

import 'app/my_app.dart';

void main() {
  final appRouter = AppRouter();
  runApp(MyApp(
    appRouter: appRouter,
  ));
}
