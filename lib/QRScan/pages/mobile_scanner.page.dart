import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/pages.dart';

import '../logic/qr_scan.provider.dart';

class MobileScannerPage extends StatefulWidget {
  const MobileScannerPage({Key? key}) : super(key: key);
  static const routeName = "/MobileScannerPage";

  @override
  State<MobileScannerPage> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  MobileScannerController cameraController = MobileScannerController();
  bool screenOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
          allowDuplicates: true,
          controller: cameraController,
          onDetect: _foundBarCode),
    );
  }

  void _foundBarCode(Barcode barcode, MobileScannerArguments? args) {
    if (!screenOpen) {
      final String code = barcode.rawValue ?? "...";
      log(code.toString());
      List data = code.split(',');
      context.read<QRScanProvider>().getResult(data[0]);
      screenOpen = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => ResultQrPage(
            resultQr: code,
            screenClosed: _screenWasClosed,
          ),
        ),
      );
    }
  }

  void _screenWasClosed() {
    screenOpen = false;
  }
}

class FoundCodeScreen extends StatelessWidget {
  const FoundCodeScreen(
      {Key? key, required this.value, required this.screenClosed})
      : super(key: key);
  final String value;
  final Function() screenClosed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(children: [Text(value)]),
      ),
    );
  }
}
