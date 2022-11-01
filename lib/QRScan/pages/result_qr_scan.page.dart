import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/qr_scan_result.model.dart';
import '../logic/qr_scan.provider.dart';

class ResultQrPage extends StatefulWidget {
  const ResultQrPage({super.key, required this.resultQr});
  final String resultQr;
  static const routeName = '/ResultQrPage';

  @override
  State<ResultQrPage> createState() => _ResultQrPageState();
}

class _ResultQrPageState extends State<ResultQrPage> {
  bool isEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      body: FutureBuilder<QrScanResult>(
          future: context.read<QRScanProvider>().getResult(widget.resultQr),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Column(
                        children: [
                          Text('Id No : ${snapShot.data!.idNo}'),
                          Text("Id Type : ${snapShot.data!.idType}"),
                          Text("Name : ${snapShot.data!.name}"),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: snapShot.data!.checked == false,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<QRScanProvider>()
                              .getUpdate(widget.resultQr);
                        },
                        child: const Text('Checked'),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
