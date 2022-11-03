import 'package:flutter/material.dart';
import 'package:qr_scan_app/core/constant/constant.dart';

class TicketAgentHomePage extends StatelessWidget {
  const TicketAgentHomePage({Key? key}) : super(key: key);
  static const routeName = '/TicketAgentHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Stack(
          children: [
            Positioned(
              top: 55,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                icon: const Icon(
                  Icons.person,
                  size: 40,
                  color: Color(0xffffbc11),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Image.asset(KImage.sangaiLogo),
                      ),
                    ],
                  ),
                ),
                getSizeBox(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Scan',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    getSizeBox(10.0),
                    const Text(
                      'Ticket',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xffffbc11),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/Scan.png'),
                  ),
                ),
                const SizedBox(
                  height: 70,
                  width: 30,
                ),
                Flexible(
                  flex: 2,
                  child: InkWell(
                    onTap: () {},
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
                          'Scan now',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
