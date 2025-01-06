import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/order/order_bloc.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/list/list_abstarct_repository.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_order/accepted_oder.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';

class AcceptedOrderScreen extends StatefulWidget {
  const AcceptedOrderScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<AcceptedOrderScreen> createState() => _AcceptedOrderScreenState();
}

class _AcceptedOrderScreenState extends State<AcceptedOrderScreen> {
  final _orderBloc = OrderBloc(
    GetIt.I<OrderAbstractRepository>(),
  );
  List<Product> selectedItems = [];

  @override
  void initState() {
    _orderBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
    // _orderBloc.add(LoadCancelationReasons());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _orderBloc
              .add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
          return completer.future;
        },
        child: BlocConsumer<OrderBloc, OrderState>(
          bloc: _orderBloc,
          builder: (context, state) {
            if (state is OrderShelfSuccess) {
              return acceptedOrderView(state.task, state.shelfs, theme, context,
                  selectedItems, setState, collect, doNotExist);
            }
            if (state is OrderFailure) {
              return FailedRequest(callback: getOrder);
            }
            return const Center(child: CircularProgressIndicator());
          },
          listener: (BuildContext context, OrderState state) {
            if (state is OrderCollectProductSuccess) {
              print("From OrderCollectProductSuccess Listener");
              getOrder();
            }
            if (state is OrderCancelReasonSuccess) {
              print("From OrderCancelReasonSuccess Listener");
            }
          },
        ),
      ),
    );
  }

  void getOrder() {
    _orderBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
  }

  void collect(List<Product> products) {
    print('Collect');
    _orderBloc.add(LoadCollectOrder(products: products, status: 'PROCESSED'));
  }

// NEW, NOT_AVAILABLE, PROCESSED
  void doNotExist(List<Product> products) {
    print('doNotExist');
    _orderBloc
        .add(LoadCollectOrder(products: products, status: 'NOT_AVAILABLE'));
  }
}
