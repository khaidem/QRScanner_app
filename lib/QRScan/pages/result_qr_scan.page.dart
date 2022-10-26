import 'package:flutter/material.dart';

class ResultQrPage extends StatelessWidget {
  const ResultQrPage({super.key, required this.resultQr});
  final String resultQr;
  static const routeName = '/ResultQrPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(resultQr),
          ],
        ),
      ),
    );
  }
}
