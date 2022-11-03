import 'package:flutter/material.dart';

import '../../core/constant/constant.dart';

class TicketSoldPage extends StatelessWidget {
  const TicketSoldPage({Key? key}) : super(key: key);
  static const routeName = '/TicketSoldPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Stack(
          children: [
            Positioned(
              top: 0,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Image.asset(KImage.sangaiLogo),
                    ),
                  ],
                ),
                getSizeBox(30.0),
                Row(
                  children: [
                    Text('Tickets', style: getExtraStyle(color: Colors.black)),
                    getSizeBox(10.0),
                    Text(
                      'Sold',
                      style: getExtraStyle(
                        color: const Color(0xfff45b69),
                      ),
                    )
                  ],
                ),
                getSizeBox(10),
                Row(
                  children: [
                    const Icon(Icons.lock_clock),
                    getSizeBoxWidth(10),
                    Text(
                      'Day 1',
                      style: getSemiBoldStyle(color: Colors.black),
                    ),
                    const Spacer(),
                    Text(
                      '21st Nov 2022',
                      style: getSemiBoldStyle(color: Colors.black),
                    )
                  ],
                ),
                getSizeBox(10),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xfff45b69),
                        Color(0xffffbc11),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            alignment: Alignment.topRight,
                            scale: 4,
                            image: AssetImage(
                              KImage.ticketLowSpa,
                            )),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1,23445',
                            style: getExtraStyle(color: Colors.black),
                          ),
                          Text(
                            'Ticket Sold',
                            style: getSemiBoldStyle(color: Colors.black),
                          )
                        ],
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
