import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/order/order_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/list/order_abstarct_repository.dart';
import 'package:j_courier/repositories/product/product_abstarct_repository.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/order_screen/orders_menu/accepted_menu_widgets.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_tabs_orders_view.dart';
import 'package:j_courier/screens/widgets/alerts/alert.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';
import 'package:j_courier/screens/widgets/tabs/tab_with_badge.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/order_accepted_options.dart';

@RoutePage()
// ignore: must_be_immutable
class AcceptedOrderTabedScreen extends StatefulWidget {
  AcceptedOrderTabedScreen({super.key, required this.task});

  Task task;

  @override
  State<AcceptedOrderTabedScreen> createState() =>
      _AcceptedOrderTabedScreenState();
}

class _AcceptedOrderTabedScreenState extends State<AcceptedOrderTabedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final OrderBloc _orderBloc = OrderBloc(
    GetIt.I<OrderAbstractRepository>(),
    GetIt.I<ProductAbstractRepository>(),
  );

  List<Shelf> shelves = [];
  List<CancelationReasons> reasons = [];
  List<AcceptedOrderScreen> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() => setState(() {}));

    _orderBloc
      ..add(LoadCancelationReasons())
      ..add(LoadAcceptedOrder(id: int.parse(widget.task.externalOrderId!)));
  }

  void loadOrder() {
    _orderBloc
        .add(LoadAcceptedOrder(id: int.parse(widget.task.externalOrderId!)));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _initTabList() {
    tabList.clear();
    // if (tabList.isEmpty) {
    tabList = [
      AcceptedOrderScreen(
          task: widget.task,
          productStatus: ProductStatus.NEW,
          shelfs: shelves,
          changeProductStatus: changeProductStatus,
          sendToDelivery: sendToDelivery,
          goToProduct: toToProduct),
      AcceptedOrderScreen(
          task: widget.task,
          productStatus: ProductStatus.NOT_AVAILABLE,
          shelfs: shelves,
          changeProductStatus: changeProductStatus,
          sendToDelivery: sendToDelivery,
          goToProduct: toToProduct),
      AcceptedOrderScreen(
          task: widget.task,
          productStatus: ProductStatus.PROCESSED,
          shelfs: shelves,
          changeProductStatus: changeProductStatus,
          sendToDelivery: sendToDelivery,
          goToProduct: toToProduct),
    ];
    // }
  }

  void changeProductStatus(List<Product> products, ProductStatus status) {
    _orderBloc.add(LoadChangeProductStatus(products: products, status: status));
  }

  void sendToDelivery() {
    _orderBloc.add(SetOrderStatus(
        externalOrderId: widget.task.externalOrderId!,
        status: OrderStatus.PROCESSED));
  }

  void _handleBackWindow() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void _cancelOrder(String cancellationReason) => _handleBackWindow();

  void _addProduct(Product product) {
    _orderBloc.add(AddProductToOrder(
      product: product,
      externalOrderId: widget.task.externalOrderId!,
    ));
  }

  Widget _buildTabBar() {
    return Container(
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
          buildTabWithBadge(
              context, S.of(context).collect, 12, _tabController.index == 0),
          buildTabWithBadge(
              context, S.of(context).absent, 12, _tabController.index == 1),
          buildTabWithBadge(
              context, S.of(context).collected, 24, _tabController.index == 2),
        ],
      ),
    );
  }

  Widget _buildTabView() {
    _initTabList();
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: tabList,
      ),
    );
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
                _cancelOrder,
                _addProduct,
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        bloc: _orderBloc,
        listener: (context, state) {
          if (state is OrderCollectProductSuccess) {
            loadOrder();
            print("From OrderCollectProductSuccess Listener");
          }
          if (state is OrderStatusFailure) {
            showAlert(context, state.exception.toString(),
                state.exception.toString());
          }
          if (state is OrderCancelReasonSuccess) {
            setState(() => reasons = state.cancelationReasons);
          } else if (state is AddProductSuccess) {
            loadOrder();
            _handleBackWindow();
            _tabController.animateTo(_tabController.index);
          } else if (state is OrderStatusSuccess) {
            loadOrder();
            _handleBackWindow();
          } else if (state is AddProductFailure) {
            showAlert(context, ' ', state.exception.toString());
          }
        },
        builder: (context, state) {
          if (state is OrderFailure) {
            return FailedRequest(
                callback: () => _orderBloc.add(LoadCancelationReasons()));
          }
          if (state is OrderShelfSuccess) {
            widget.task = state.task;
            shelves = state.shelfs;
          }

          return Column(
            children: [
              _buildTabBar(),
              _buildTabView(),
            ],
          );
        },
      ),
    );
  }

  void toToProduct(Product product) {
    AutoRouter.of(context).push(ProductRoute(product: product)).then((onValue) {
      print('ObNacking ${onValue}');
      // if (onValue == "refreshData") {
      loadOrder();
      // }
    });
  }
}
