import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/logic/qr_scan.provider.dart';
import 'package:qr_scan_app/QRScan/pages/mobile_scanner.page.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';
import 'package:qr_scan_app/QRScan/widgets/widgets.dart';
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
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => QRScanProvider(),
        )
      ],
      child: Consumer<AuthService>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Qr Scan',
          theme: ThemeData(fontFamily: GoogleFonts.raleway().fontFamily),
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          home: auth.isAuth
              ? const QrScannerPage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResult) =>
                      authResult.connectionState == ConnectionState.waiting
                          ? const SplashScreenPage()
                          : const LoginPage(),
                ),
          routes: {
            QrCameraPage.routeName: (context) => const QrCameraPage(),
            MobileScannerPage.routeName: (context) => const MobileScannerPage()
          },
        ),
      ),
    );
  }
}
