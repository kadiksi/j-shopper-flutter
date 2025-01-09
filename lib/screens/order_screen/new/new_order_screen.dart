import 'dart:async';

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
import 'package:j_courier/screens/history_screens/active_orders/active_order_screen.dart';
import 'package:j_courier/screens/order_screen/order/order.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/order_new_options.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';

@RoutePage()
class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final _listBloc = OrderBloc(
    GetIt.I<OrderAbstractRepository>(),
  );
  List<Product> selectedItems = [];
  List<CancelationReasons> reasons = [];

  @override
  void initState() {
    // _listBloc.add(LoadCancelationReasons());
    callback();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:
            Text(S.of(context).order_number('${widget.task.externalOrderId}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showNewOrderOptions(
                context,
                showModelCancelOrder,
                reasons,
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          callback();
          return completer.future;
        },
        child: BlocConsumer<OrderBloc, OrderState>(
            bloc: _listBloc,
            builder: (context, state) {
              if (state is OrderShelfSuccess) {
                return newOrderView(state.task, state.shelfs, theme, context,
                    selectedItems, setState, callback);
              }
              if (state is OrderFailure) {
                return FailedRequest(callback: callback);
              }
              return const Center(child: CircularProgressIndicator());
            },
            listener: (BuildContext context, OrderState state) {
              // if (state is OrderCancelReasonSuccess) {
              //   reasons = state.cancelationReasons;
              //   print("From OrderCancelReasonSuccess Listener");
              // }
            }),
      ),
    );
  }

  void callback() {
    _listBloc.add(LoadNewOrder(id: int.parse(widget.task.externalOrderId!)));
  }
}

void addProduct() {
  print("Add Product");
}

void returnOrder() {
  print("return order");
}
