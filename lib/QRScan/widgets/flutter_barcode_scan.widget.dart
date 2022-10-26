import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FlutterBarcodeScannerWidget extends StatelessWidget {
  const FlutterBarcodeScannerWidget({super.key});
  static const routeName = '/FlutterBarcodeScannerWidget';

  @override
  Widget build(BuildContext context) {
    String scanBarcode = 'Unknown';

    Future ScanBarCode() async {
      String scanResult;
      try {
        scanResult = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
      } on PlatformException {
        scanResult = 'Failed to get paltform version';
      }
    }

    return const Scaffold();
  }
}
