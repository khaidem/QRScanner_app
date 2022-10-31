import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';
import 'package:qr_scan_app/onbaording/logic/auth_service.dart';
import 'package:qr_scan_app/onbaording/pages/login.page.dart';
import 'package:qr_scan_app/onbaording/pages/splash_screen.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: Consumer<AuthService>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,

          home: auth.isAuth
              ? const QrScannerPage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResult) =>
                      authResult.connectionState == ConnectionState.waiting
                          ? const SplashScreenPage()
                          : const LoginPage()),
          // routes: {
          //   QrScanCamera.routeName: (context) => const QrScanCamera(),
          //   FlutterBarcodeScannerWidget.routeName: (context) =>
          //       const FlutterBarcodeScannerWidget()
          // },
        ),
      ),
    );
  }
}
