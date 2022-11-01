import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/data/model/qr_scan_result.model.dart';
import 'package:qr_scan_app/QRScan/pages/qr_camera.Page.dart';
import 'package:qr_scan_app/onbaording/logic/auth_service.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({
    super.key,
  });

  static const routeName = "/QrScannerPage";
  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late Future<QrScanResult> futureAlbum;
  // String? resultScan;
  // Future ScanBarCode() async {
  //   String scanResult;
  //   try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'cancel', true, ScanMode.DEFAULT);
  //   } on PlatformException {
  //     scanResult = 'Failed to get paltform version';
  //   }
  //   if (!mounted) return;
  //   if (scanResult.isEmpty) return;

  //   setState(() {
  //     resultScan = scanResult;

  //     // Navigator.pushReplacement(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (context) => ResultQrPage(resultQr: scanResult),
  //     //   ),
  //     // );
  //     print('check Qr $scanResult');
  //     logger.d(scanResult);
  //   });
  // }

// @override
//   void initState() {

//     super.initState();
//     futureAlbum = context.read<QRScanProvider>().getResult(id);
//   }

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
                  if (value == 'Add New user') {
                    context.read<AuthService>().logOut();
                  }
                },
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QrCameraPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Scan'),
              ),
            ],
          ),
        ));
  }
}
