import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';

import '../../core/widget/eld.dart';
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
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      // ),
      body: FutureBuilder<QrScanResult>(
        future: context.read<QRScanProvider>().getResult(widget.resultQr),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return const Text('Something went Wrong');
          } else if (snapShot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: 70,
                        child: Image.asset(
                            'assets/images/IMG-20221102-WA0002.jpg'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/ticketss.png'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Ticket Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Name :'),
                            Text(
                              snapShot.data!.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Id Number :'),
                            Text(
                              snapShot.data!.idNo,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Id Type: '),
                            Text(
                              snapShot.data!.idType,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: snapShot.data!.checked,
                    child: SizedBox(
                      width: 500,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff45b69),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                        onPressed: null,
                        child: const Text('Already Check'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: snapShot.data!.checked == false,
                    child: SizedBox(
                      width: 500,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff45b69),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                        onPressed: () {
                          context
                              .read<QRScanProvider>()
                              .getUpdate(widget.resultQr)
                              .then(
                                (value) =>
                                    Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const QrScannerPage(),
                                  ),
                                ),
                              );

                          showSuccess(title: 'Success');
                        },
                        child: const Text('CHECK'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
