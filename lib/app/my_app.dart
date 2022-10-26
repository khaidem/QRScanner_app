import 'package:flutter/material.dart';

import '../QRScan/example.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QrScannerPage(),
      routes: {
        QrScanCamera.routeName: (context) => const QrScanCamera(),
        FlutterBarcodeScannerWidget.routeName: (context) =>
            const FlutterBarcodeScannerWidget()
      },
    );
  }
}
