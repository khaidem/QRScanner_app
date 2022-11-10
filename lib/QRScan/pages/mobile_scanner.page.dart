import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateAppbar();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,

      //or set color with: Color(0xFF0000FF)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Scan Ticket'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
              fit: BoxFit.cover,
              allowDuplicates: true,
              controller: cameraController,
              onDetect: _foundBarCode),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white38, width: 4.0),
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
              ),
            ),
          ),
        ],
      ),
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
