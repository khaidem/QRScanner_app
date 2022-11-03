import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/logic/qr_scan.provider.dart';
import 'package:qr_scan_app/QRScan/pages/ticket_agent_home.page.dart';
import 'package:qr_scan_app/QRScan/pages/ticket_sold.page.dart';
import 'package:qr_scan_app/onbaording/logic/auth_service.dart';
import 'package:qr_scan_app/onbaording/pages/otp_login.page.dart';
import 'package:qr_scan_app/onbaording/pages/verification_otp.page.dart';
import 'package:qr_scan_app/router/bottom_navigation.router.dart';

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
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          home: const OtpLoginPage(),
          routes: {
            VerificationOtpPage.routeName: (context) =>
                const VerificationOtpPage(),
            TicketAgentHomePage.routeName: (context) =>
                const TicketAgentHomePage(),
            TicketSoldPage.routeName: (context) => const TicketSoldPage(),
            BottomNavigationBarRouter.routeName: (context) =>
                const BottomNavigationBarRouter()
          },
        ),
      ),
    );
  }
}
