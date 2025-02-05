import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/order/order_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/list/list_abstarct_repository.dart';
import 'package:j_courier/screens/order_screen/orders_menu/accepted_menu_widgets.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_tabs_orders_view.dart';
import 'package:j_courier/screens/widgets/alerts/alert.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';
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

  final _orderBloc = OrderBloc(
    GetIt.I<OrderAbstractRepository>(),
  );
  List<CancelationReasons> reasons = [];

  List<AcceptedOrderScreen> tabList = [];

  @override
  void initState() {
    super.initState();
    initTabController();
    _orderBloc.add(LoadCancelationReasons());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  initTabController() {
    tabList.addAll([
      AcceptedOrderScreen(task: widget.task, productStatus: ProductStatus.NEW),
      AcceptedOrderScreen(
          task: widget.task, productStatus: ProductStatus.NOT_AVAILABLE),
      AcceptedOrderScreen(
          task: widget.task, productStatus: ProductStatus.PROCESSED),
    ]);

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
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
              showAcceptedOrderOptions(
                  context,
                  showModelAddProduct,
                  showModelCancelOrder,
                  reasons,
                  showModelReturnOrder,
                  cancelOrder,
                  addProduct);
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
            child: BlocConsumer<OrderBloc, OrderState>(
              bloc: _orderBloc,
              builder: (context, state) {
                if (state is OrderCancelReasonSuccess) {
                  return tabBars();
                }
                if (state is AddProductSuccess) {
                  return tabBars();
                }
                if (state is OrderStatusSuccess) {
                  return tabBars();
                }
                if (state is OrderFailure) {
                  return FailedRequest(callback: loadCancelationReasons);
                }
                return const Center(child: CircularProgressIndicator());
              },
              listener: (BuildContext context, OrderState state) {
                if (state is OrderCancelReasonSuccess) {
                  reasons = state.cancelationReasons;
                } else if (state is AddProductSuccess) {
                  handleBackWindow();
                  // initTabController();
                  _tabController.animateTo(_tabController.index);
                  setState(() {});
                } else if (state is OrderStatusSuccess) {
                  handleBackWindow();
                } else if (state is AddProductFailure) {
                  showAlert(context, ' ', state.exception.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void loadCancelationReasons() {
    _orderBloc.add(LoadCancelationReasons());
  }

  void handleBackWindow() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void cancelOrder(String cancellationReason) {
    handleBackWindow();
  }

  void addProduct(Product product) {
    _orderBloc.add(AddProductToOrder(
        product: product, externalOrderId: widget.task.externalOrderId!));
  }

  tabBars() {
    return TabBarView(
      controller: _tabController,
      children: tabList,
    );
  }
}
