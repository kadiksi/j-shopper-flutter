import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_tabs_orders_view.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

@RoutePage()
class AcceptedOrderTabedScreen extends StatefulWidget {
  const AcceptedOrderTabedScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<AcceptedOrderTabedScreen> createState() =>
      _AcceptedOrderTabedScreenState();
}

class _AcceptedOrderTabedScreenState extends State<AcceptedOrderTabedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(2.0),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              dividerHeight: 0,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                _buildTabWithBadge(
                    S.of(context).collect, 12, _tabController.index == 0),
                _buildTabWithBadge(
                    S.of(context).absent, 12, _tabController.index == 1),
                _buildTabWithBadge(
                    S.of(context).collected, 24, _tabController.index == 2),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AcceptedOrderScreen(task: widget.task),
                AcceptedOrderScreen(task: widget.task),
                AcceptedOrderScreen(task: widget.task),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabWithBadge(String title, int count, bool isSelected) {
    final theme = Theme.of(context);
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          divider8,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: isSelected
                    ? theme.colorScheme.onSecondary
                    : theme.colorScheme.surfaceTint,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
