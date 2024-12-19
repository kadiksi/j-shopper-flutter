import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/order_screen/orders_menu/accepted_menu_widgets.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_tabs_orders_view.dart';
import 'package:j_courier/screens/widgets/tabs/tab_with_badge.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/order_accepted_options.dart';

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
      appBar: AppBar(
        title:
            Text(S.of(context).order_number('${widget.task.externalOrderId}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              final List<String> reasons = [
                'Reason 1',
                'Reason 2',
                'Reason 3',
                // Add more reasons if needed
              ];
              showAcceptedOrderOptions(
                  context,
                  showModelAddProduct,
                  widget.task.productList!,
                  showModelCancelOrder,
                  reasons,
                  showModelReturnOrder);
            },
          ),
        ],
      ),
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
                buildTabWithBadge(context, S.of(context).collect, 12,
                    _tabController.index == 0),
                buildTabWithBadge(context, S.of(context).absent, 12,
                    _tabController.index == 1),
                buildTabWithBadge(context, S.of(context).collected, 24,
                    _tabController.index == 2),
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
}
