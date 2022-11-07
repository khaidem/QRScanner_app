import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';
import 'package:qr_scan_app/core/helper/logger.dart';

import '../../core/constant/constant.dart';
import '../../onbaording/logic/auth_service.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({
    super.key,
  });

  static const routeName = "/QrScannerPage";
  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  var isDisable = true;
  final String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  final Shader linearGradient = const LinearGradient(
    colors: [
      Color(0xfff45b69),
      Color(0xffffbc11),
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 0.0, 00.0));

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      logger.d(barcodeScanRes);
      if (barcodeScanRes.isEmpty) {
        return;
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    } catch (error) {
      EasyLoading.showToast(error.toString());
    }
//barcode scanner flutter ant

    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    // });
  }

  // Future<void> scanQR() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //   if (barcodeScanRes) {
  //     return;
  //   } else {
  //     setState(() {
  //       _scanBarcode = barcodeScanRes;
  //       final result = barcodeScanRes;
  //       logger.d(result);

  //       List data = _scanBarcode.split(',');
  //       context.read<QRScanProvider>().getResult(data[0]);

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ResultQrPage(resultQr: result),
  //         ),
  //       );
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35),
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 30,
            right: 0,
            child: IconButton(
              onPressed: () {
                context.read<AuthService>().logOut();
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: const Icon(
                Icons.logout,
                size: 40,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            right: 150,
            top: 20,
            child: Container(
              alignment: Alignment.center,
              height: 70,
              child: Row(
                children: [
                  Image.asset(
                    KImage.sangLogo,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Scan',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ticket',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/Scan.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  scanQR();
                },
                child: Container(
                  width: 500,
                  height: 55,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.0, 0.0],
                      colors: [
                        Color(0xfff45b69),
                        Color(0xffffbc11),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Scan now',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
