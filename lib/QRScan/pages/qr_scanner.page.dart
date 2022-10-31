import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scan_app/QRScan/pages/qr_camera.Page.dart';
import 'package:qr_scan_app/core/helper/logger.dart';
import 'package:qr_scan_app/router/router.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({
    super.key,
  });

  static const routeName = "/QrScannerPage";
  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  String? resultScan;
  Future ScanBarCode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'cancel', true, ScanMode.DEFAULT);
    } on PlatformException {
      scanResult = 'Failed to get paltform version';
    }
    if (!mounted) return;
    if (scanResult.isEmpty) return;

    setState(() {
      resultScan = scanResult;

      context.router.replace(ResultQrRoute(resultQr: scanResult));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ResultQrPage(resultQr: scanResult),
      //   ),
      // );
      print('check Qr $scanResult');
      logger.d(scanResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        centerTitle: true,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Add New user',
                  child: SizedBox(
                    child: Text("Logout"),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'Add New user') {}
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCameraPage(),
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Scan'),
            ),

            // ElevatedButton.icon(
            //   onPressed: ScanBarCode,
            //   icon: const Icon(Icons.camera_alt_outlined),
            //   label: const Text('Scan'),
            // ),
          ],
        ),
      ),
    );
  }
}
