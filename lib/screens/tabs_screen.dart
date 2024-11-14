import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/screens/history_screens/history_view.dart';
import 'package:j_courier/screens/notifications_screens/notification_screen.dart';
import 'package:j_courier/screens/order_screen/orders_view.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 2;
  String _tabName = '';
  List<String> tabNames = [];
  final List<Widget> _pages = [
    const Column(
      children: [
        Expanded(child: OrdersScreen()),
      ],
    ),
    const Column(
      children: [
        Expanded(child: HistoryScreen()),
      ],
    ),
    // const Column(
    //   children: [
    //     Expanded(
    //       child: Center(child: Text("Скан QR Page")), // QR Scan
    //     ),
    //   ],
    // ),
    Column(
      children: [
        Expanded(
          child: Notifications(), // Notifications
        ),
      ],
    ),
    const Column(
      children: [
        Expanded(
          child: Center(child: Text("Профиль Page")), // Profile
        ),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabName = tabNames[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tabNames.isEmpty) {
      tabNames.add(S.of(context).orders);
      tabNames.add(S.of(context).history);
      // tabNames.add(S.of(context).scan_qr);
      tabNames.add(S.of(context).notifications);
      tabNames.add(S.of(context).profile);
    }
    _tabName = tabNames[_selectedIndex];
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(_tabName, style: theme.textTheme.headlineLarge),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TalkerScreen(
                    talker: GetIt.I<Talker>(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.document_scanner_outlined,
            ),
          )
        ],
      ),
      body: _pages[_selectedIndex], // Directly use the page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _bottomItem(S.of(context).orders, 'assets/svg/tabs/orders.svg',
              'assets/svg/tabs/orders_active.svg', theme),
          _bottomItem(S.of(context).history, 'assets/svg/tabs/clock.svg',
              'assets/svg/tabs/clock_active.svg', theme),
          // _bottomItem(S.of(context).scan_qr, 'assets/svg/tabs/qr.svg',
          //     'assets/svg/tabs/qr_active.svg', theme),
          _bottomItem(
              S.of(context).notifications,
              'assets/svg/tabs/notification.svg',
              'assets/svg/tabs/notification_active.svg',
              theme),
          _bottomItem(S.of(context).profile, 'assets/svg/tabs/profile.svg',
              'assets/svg/tabs/profile_active.svg', theme),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _bottomItem(String name, String path, String activePath, ThemeData theme) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        path,
      ),
      activeIcon: SvgPicture.asset(
        activePath,
      ),
      label: name,
    );
  }
}
