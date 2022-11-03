import 'package:flutter/material.dart';
import 'package:qr_scan_app/QRScan/pages/ticket_agent_home.page.dart';
import 'package:qr_scan_app/QRScan/pages/ticket_sold.page.dart';

class BottomNavigationBarRouter extends StatefulWidget {
  const BottomNavigationBarRouter({Key? key}) : super(key: key);
  static const routeName = '/BottomNavigationBarRouter';

  @override
  State<BottomNavigationBarRouter> createState() =>
      _BottomNavigationBarRouterState();
}

class _BottomNavigationBarRouterState extends State<BottomNavigationBarRouter> {
  int currentIndex = 0;
  String? currentpage;
  //** Add Page For BottomNavigation  */
  final List pages = [const TicketAgentHomePage(), const TicketSoldPage()];
  //*** This For  BottomNavigationPage to Set Global Declare so that all the page get
//**   BottomNavigation */  */
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Ticket',
            icon: Icon(Icons.airplane_ticket),
          ),
        ],
      ),
      body: Stack(children: [buildNavigator()]),
    );
  }

  // ** The route generator callback used when the app is navigated to a named
//**route. This is used if routes do not contain the requested route.
  buildNavigator() {
    return Navigator(
      key: navigatorKeys[currentIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) => pages.elementAt(currentIndex),
        );
      },
    );
  }
}
