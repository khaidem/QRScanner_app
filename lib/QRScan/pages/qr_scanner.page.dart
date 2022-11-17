import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/mobile_scanner.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? name;

  @override
  void initState() {
    super.initState();
    _updateAppbar();
    loginStatus();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,

      //or set color with: Color(0xFF0000FF)
    ));
  }

  void loginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("venue").toString();

      log(name.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35),
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 10,
            right: 0,
            child: IconButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(''),
                      content: const Text('Do You want to logOut?'),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Yes'),
                          onPressed: () {
                            context.read<AuthService>().logOut();
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              backgroundColor: Colors.black),
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              // alignment: Alignment.center,
              height: 100,
              child: Image.asset(
                KImage.sangLogo,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    GradientText(
                      'Sangai E-Ticket Checker',
                      gradient: LinearGradient(colors: [
                        Color(0xfff45b69),
                        Color(0xffffbc11),
                      ]),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
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
                  Navigator.of(context).pushNamed(MobileScannerPage.routeName);
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

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
    );
  }
}
