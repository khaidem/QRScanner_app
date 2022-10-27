// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scan_camera.page.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';
import 'package:qr_scan_app/QRScan/pages/result_qr_scan.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: QrScannerPage,
      initial: true,
    ),
    AutoRoute(page: ResultQrPage, path: ''),
    AutoRoute(
      page: QrScanCameraPage,
      path: '',
    ),
  ],
)
class $AppRouter {}
//** We Should set the page argument to  EmptyRouterPage whenever we have nested route
//** for a specific bottom Naviagtion tab*/