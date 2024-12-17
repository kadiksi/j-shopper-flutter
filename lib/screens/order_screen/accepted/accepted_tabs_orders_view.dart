import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/order/order_bloc.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/list/list_abstarct_repository.dart';
import 'package:j_courier/screens/order_screen/oder/oder.dart';
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
    GetIt.I<ListAbstractRepository>(),
  );
  // final _shelfBloc = ShelfBloc(
  //   GetIt.I<ListAbstractRepository>(),
  // );
  List<int> selectedItems = [];

  @override
  void initState() {
    _orderBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
    // _shelfBloc.add(LoadShelf());
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
        child: BlocBuilder<OrderBloc, OrderState>(
          bloc: _orderBloc,
          builder: (context, state) {
            if (state is OrderShelfSuccess) {
              return orderView(state.task, state.shelfs, theme, context,
                  selectedItems, setState);
            }
            if (state is OrderFailure) {
              return FailedRequest(callback: callback);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void callback() {
    _orderBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
  }
}
