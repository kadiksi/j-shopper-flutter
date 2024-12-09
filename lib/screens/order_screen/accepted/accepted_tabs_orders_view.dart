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
  final _listBloc = OrderBloc(
    GetIt.I<ListAbstractRepository>(),
  );
  List<int> selectedItems = [];

  @override
  void initState() {
    _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
          return completer.future;
        },
        child: BlocBuilder<OrderBloc, OrderState>(
          bloc: _listBloc,
          builder: (context, state) {
            if (state is OrderSuccess) {
              return orderView(
                  state.tasks, theme, context, selectedItems, setState);
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
    _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
  }
}
