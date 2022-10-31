import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ResultQrPage extends StatefulWidget {
  const ResultQrPage({super.key, required this.resultQr});
  final String resultQr;
  static const routeName = '/ResultQrPage';

  @override
  State<ResultQrPage> createState() => _ResultQrPageState();
}

class _ResultQrPageState extends State<ResultQrPage> {
  String? scanResult;
  Future ScanBarCode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      scanResult = 'Failed to get paltform version';
    }
    if (!mounted) return;

    setState(() {
      this.scanResult = scanResult;

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ResultQrPage(resultQr: scanResult),
      //   ),
      // );
      print('check Qr $scanResult');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('scan'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.resultQr),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('check'))
          ],
        ),
      ),
    );
  }
}
