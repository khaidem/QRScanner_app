import 'package:flutter/material.dart';
import 'package:qr_scan_app/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // showSemanticsDebugger: true,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const QrScannerPage(),
      // routes: {
      //   QrScanCamera.routeName: (context) => const QrScanCamera(),
      //   FlutterBarcodeScannerWidget.routeName: (context) =>
      //       const FlutterBarcodeScannerWidget()
      // },
    );
  }
}
