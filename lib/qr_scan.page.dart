import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});
  static const routeName = '/QrScanPage';

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QRScan');
  Barcode? result;
  QRViewController? QRcontroller;

  void resemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      QRcontroller!.pauseCamera();
    } else if (Platform.isIOS) {
      QRcontroller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            height: 300,
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(),
            ),
          ),
          // Text(result != null ? "Result: ${result!.code}" : 'Scan code')
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    QRcontroller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        controller.pauseCamera();
        final String qrCode = event.code.toString();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResultQrPage(resultQr: qrCode)));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    QRcontroller?.dispose();
  }
}

class ResultQrPage extends StatelessWidget {
  const ResultQrPage({super.key, required this.resultQr});
  final String resultQr;
  static const routeName = '/ResultQrPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(resultQr),
        ],
      ),
    );
  }
}
