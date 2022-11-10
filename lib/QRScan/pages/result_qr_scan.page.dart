import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';

import '../../core/constant/constant.dart';
import '../../core/widget/eld.dart';
import '../data/model/qr_scan_result.model.dart';
import '../logic/qr_scan.provider.dart';

class ResultQrPage extends StatefulWidget {
  const ResultQrPage(
      {super.key, required this.resultQr, required this.screenClosed});
  final String resultQr;
  final Function() screenClosed;
  static const routeName = '/ResultQrPage';

  @override
  State<ResultQrPage> createState() => _ResultQrPageState();
}

class _ResultQrPageState extends State<ResultQrPage> {
  bool isEnable = false;
  @override
  void initState() {
    _updateAppbar();
    super.initState();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,

      //or set color with: Color(0xFF0000FF)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35),
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<QrScanResult>(
            future: context.read<QRScanProvider>().getResult(widget.resultQr),
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return const Center(
                  child: Text(
                    'Invalid Ticket ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 224, 66, 119),
                        fontWeight: FontWeight.bold),
                  ),
                );
              } else if (snapShot.hasData) {
                return Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: SizedBox(
                        // alignment: Alignment.center,
                        height: 100,
                        child: Image.asset(
                          KImage.sangLogo,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 100,
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
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Table(
                          defaultColumnWidth: const FixedColumnWidth(120),
                          children: [
                            TableRow(children: [
                              Column(children: const [
                                Text('Name :', style: TextStyle(fontSize: 15.0))
                              ]),
                              Column(children: [
                                Text(
                                  snapShot.data!.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                )
                              ]),
                            ]),
                            const TableRow(children: [
                              SizedBox(
                                height: 5,
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Id Number :',
                                    style: TextStyle(fontSize: 15.0))
                              ]),
                              Column(children: [
                                Text(
                                  snapShot.data!.idNo,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                )
                              ]),
                            ]),
                            const TableRow(children: [
                              SizedBox(
                                height: 5,
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Column(children: const [
                                Text('Id Type: ',
                                    style: TextStyle(fontSize: 15.0))
                              ]),
                              Column(children: [
                                Text(
                                  snapShot.data!.idType,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                )
                              ]),
                            ]),
                            const TableRow(
                              children: [
                                SizedBox(
                                  height: 5,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<QRScanProvider>()
                                  .getUpdate(widget.resultQr)
                                  .then(
                                    (value) =>
                                        Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const QrScannerPage(),
                                      ),
                                    ),
                                  );

                              showSuccess(title: 'Success');
                            },
                            child: Container(
                              width: 500,
                              height: 55,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  // stops: [0.0, 0.0],
                                  colors: [
                                    Color(0xfff45b69),
                                    Color(0xffffbc11),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Check',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Visibility(
                        //   visible: snapShot.data!.checked == false,
                        //   child: SizedBox(
                        //     width: 500,
                        //     height: 55,
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: const Color(0xfff45b69),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(
                        //             20,
                        //           ),
                        //         ),
                        //       ),
                        //       onPressed: () {
                        //         context
                        //             .read<QRScanProvider>()
                        //             .getUpdate(widget.resultQr)
                        //             .then(
                        //               (value) =>
                        //                   Navigator.of(context).pushReplacement(
                        //                 MaterialPageRoute(
                        //                   builder: (context) => const QrScannerPage(),
                        //                 ),
                        //               ),
                        //             );

                        //         showSuccess(title: 'Success');
                        //       },
                        //       child: const Text('CHECK'),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
