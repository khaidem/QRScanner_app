import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/qr_camera.Page.dart';

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
  final bool _isAcceptTermsAndConditions = true;
  var isDisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25),
      child: Stack(
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
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 150,
                child: Row(
                  children: [
                    Image.asset('assets/images/IMG-20221102-WA0002.jpg'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/Scan.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Scan',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ticket',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 224, 66, 119),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
                width: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QrCameraPage(),
                    ),
                  );
                },
                child: Container(
                  width: 500,
                  height: 55,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.0],
                      colors: [
                        Color(0x00FFBC11),
                        Color(0xfff45b69),
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
      ),
    ));
  }
}
