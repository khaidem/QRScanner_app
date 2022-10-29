// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:qr_scan_app/QRScan/pages/qr_camera.Page.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';
import 'package:qr_scan_app/QRScan/pages/result_qr_scan.page.dart';
import 'package:qr_scan_app/onbaording/pages/login.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: QrScannerPage),
    AutoRoute(page: ResultQrPage),
    AutoRoute(page: QrCameraPage),
  ],
)
class $AppRouter {}
//** We Should set the page argument to  EmptyRouterPage whenever we have nested route
//** for a specific bottom Naviagtion tab*/