import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/core/constant/constant.dart';

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
        body: FutureBuilder<QrScanResult>(
          future: context.read<QRScanProvider>().getResult(widget.resultQr),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Invalid Ticket ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 224, 66, 119),
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Back'))
                  ],
                ),
              );
            } else if (snapShot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                        ),
                        Image.asset(
                          KImage.sangLogo,
                          height: 100,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 150,
                      child: Image.asset(KImage.qrScan2),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Ticket Details',
                      style: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Table(
                      defaultColumnWidth: const FixedColumnWidth(120),
                      children: [
                        TableRow(
                          children: [
                            Column(children: [
                              Text(
                                'Name :',
                                style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ]),
                            Column(
                              children: [
                                Text(
                                  snapShot.data!.name,
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
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
                          Column(children: [
                            Text(
                              'Age:',
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ]),
                          Column(children: [
                            Text(
                              snapShot.data!.age.toString(),
                              style: GoogleFonts.raleway(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
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
                          Column(
                            children: [
                              Text(
                                'Gender: ',
                                style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Text(
                              snapShot.data!.gender,
                              style: GoogleFonts.raleway(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
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
                      height: 50,
                    ),
                    Visibility(
                      visible: snapShot.data!.checked,
                      child: SizedBox(
                        width: 500,
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(),
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
                            child: const Text(
                              'Already Check',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: snapShot.data!.checked == false,
                      child: InkWell(
                        onTap: () {
                          context
                              .read<QRScanProvider>()
                              .getUpdate(widget.resultQr);
                          Navigator.of(context).pop();
                          // .then(
                          //   (value) =>
                          //   //     Navigator.of(context).pushReplacement(
                          //   //   MaterialPageRoute(
                          //   //     builder: (context) => const QrScannerPage(),
                          //   //   ),
                          //   // ),
                          // );

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
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
