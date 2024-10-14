import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';

@RoutePage()
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Column(
      children: [
        Expanded(
          child: Center(child: Text("Заказы Page")), // Orders
        ),
      ],
    ),
    const Column(
      children: [
        Expanded(
          child: Center(child: Text("История Page")), // History
        ),
      ],
    ),
    const Column(
      children: [
        Expanded(
          child: Center(child: Text("Скан QR Page")), // QR Scan
        ),
      ],
    ),
    const Column(
      children: [
        Expanded(
          child: Center(child: Text("Уведомления Page")), // Notifications
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar Example'),
      ),
      body: _pages[_selectedIndex], // Directly use the page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _bottomItem(S.of(context).orders, 'assets/svg/orders.svg', theme),
          _bottomItem(S.of(context).history, 'assets/svg/clock.svg', theme),
          _bottomItem(S.of(context).scan_qr, 'assets/svg/qr.svg', theme),
          _bottomItem(S.of(context).notifications,
              'assets/svg/notification.svg', theme),
          _bottomItem(S.of(context).profile, 'assets/svg/profile.svg', theme),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _bottomItem(String name, String path, ThemeData theme) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        path,
        colorFilter:
            ColorFilter.mode(theme.colorScheme.onSurface, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        path,
        colorFilter:
            ColorFilter.mode(theme.colorScheme.secondary, BlendMode.srcIn),
      ),
      label: name,
    );
  }
}
