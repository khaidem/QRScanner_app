import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(43),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    KImage.sangLogo,
                    height: 105 + 20,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Do You want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Color(0xfff45b69),
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  context.read<AuthService>().logOut();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
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
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     // Text('Scan', style:Colors.black),
              //     // const GradientText(
              //     //   'Ticket',
              //     //   gradient: LinearGradient(colors: [
              //     //     Color(0xfff45b69),
              //     //     Color(0xffffbc11),
              //     //   ]),
              //     //   fontSize: 25,
              //     // ),
              //   ],
              // ),
              const SizedBox(
                height: 50,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'E-Ticket',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                    GradientText(
                      ' Checker',
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfff45b69),
                          Color(0xffffbc11),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name ?? '',
                    style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                    // style: const TextStyle(
                    //   color: Colors.black,
                    //   fontSize: 20.0,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: Image.asset(KImage.qrScan1),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (ctx) => const MobileScannerPage()),
                  );
                },
                child: Container(
                  width: 300,
                  height: 50,
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
        ),
      ),
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
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
      ),
    );
  }
}
