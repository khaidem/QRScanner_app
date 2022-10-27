// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../QRScan/pages/qr_scan_camera.page.dart' as _i3;
import '../QRScan/pages/qr_scanner.page.dart' as _i1;
import '../QRScan/pages/result_qr_scan.page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    QrScannerRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.QrScannerPage(),
      );
    },
    ResultQrRoute.name: (routeData) {
      final args = routeData.argsAs<ResultQrRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ResultQrPage(
          key: args.key,
          resultQr: args.resultQr,
        ),
      );
    },
    QrScanCameraRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.QrScanCameraPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          QrScannerRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          ResultQrRoute.name,
          path: '',
        ),
        _i4.RouteConfig(
          QrScanCameraRoute.name,
          path: '',
        ),
      ];
}

/// generated route for
/// [_i1.QrScannerPage]
class QrScannerRoute extends _i4.PageRouteInfo<void> {
  const QrScannerRoute()
      : super(
          QrScannerRoute.name,
          path: '/',
        );

  static const String name = 'QrScannerRoute';
}

/// generated route for
/// [_i2.ResultQrPage]
class ResultQrRoute extends _i4.PageRouteInfo<ResultQrRouteArgs> {
  ResultQrRoute({
    _i5.Key? key,
    required String resultQr,
  }) : super(
          ResultQrRoute.name,
          path: '',
          args: ResultQrRouteArgs(
            key: key,
            resultQr: resultQr,
          ),
        );

  static const String name = 'ResultQrRoute';
}

class ResultQrRouteArgs {
  const ResultQrRouteArgs({
    this.key,
    required this.resultQr,
  });

  final _i5.Key? key;

  final String resultQr;

  @override
  String toString() {
    return 'ResultQrRouteArgs{key: $key, resultQr: $resultQr}';
  }
}

/// generated route for
/// [_i3.QrScanCameraPage]
class QrScanCameraRoute extends _i4.PageRouteInfo<void> {
  const QrScanCameraRoute()
      : super(
          QrScanCameraRoute.name,
          path: '',
        );

  static const String name = 'QrScanCameraRoute';
}
