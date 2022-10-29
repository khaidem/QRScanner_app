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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../onbaording/pages/login.page.dart' as _i1;
import '../QRScan/pages/qr_camera.Page.dart' as _i4;
import '../QRScan/pages/qr_scanner.page.dart' as _i2;
import '../QRScan/pages/result_qr_scan.page.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.QrScannerPage(),
      );
    },
    ResultQrRoute.name: (routeData) {
      final args = routeData.argsAs<ResultQrRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ResultQrPage(
          key: args.key,
          resultQr: args.resultQr,
        ),
      );
    },
    QrCameraRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.QrCameraPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          QrScannerRoute.name,
          path: '/qr-scanner-page',
        ),
        _i5.RouteConfig(
          ResultQrRoute.name,
          path: '/result-qr-page',
        ),
        _i5.RouteConfig(
          QrCameraRoute.name,
          path: '/qr-camera-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.QrScannerPage]
class QrScannerRoute extends _i5.PageRouteInfo<void> {
  const QrScannerRoute()
      : super(
          QrScannerRoute.name,
          path: '/qr-scanner-page',
        );

  static const String name = 'QrScannerRoute';
}

/// generated route for
/// [_i3.ResultQrPage]
class ResultQrRoute extends _i5.PageRouteInfo<ResultQrRouteArgs> {
  ResultQrRoute({
    _i6.Key? key,
    required String resultQr,
  }) : super(
          ResultQrRoute.name,
          path: '/result-qr-page',
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

  final _i6.Key? key;

  final String resultQr;

  @override
  String toString() {
    return 'ResultQrRouteArgs{key: $key, resultQr: $resultQr}';
  }
}

/// generated route for
/// [_i4.QrCameraPage]
class QrCameraRoute extends _i5.PageRouteInfo<void> {
  const QrCameraRoute()
      : super(
          QrCameraRoute.name,
          path: '/qr-camera-page',
        );

  static const String name = 'QrCameraRoute';
}
