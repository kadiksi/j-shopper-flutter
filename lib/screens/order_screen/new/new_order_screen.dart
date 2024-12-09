import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/order/order_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/list/list_abstarct_repository.dart';
import 'package:j_courier/screens/order_screen/oder/oder.dart';
import 'package:j_courier/screens/product_screen/product_replacement_screen.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/cancel_order.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/order_options.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/return_order.dart';
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
              showOrderOptions(
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

void showModelAddProduct(BuildContext context, List<Product> products) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => ProductReplacementSheet(
        products: products,
        isReplace: false,
        action: addProduct,
        title: S.of(context).add_product),
  );
}

void showModelCancelOrder(BuildContext context, List<String> reasons) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => ReasonSelectionSheet(reasons: reasons),
  );
}

void showModelReturnOrder(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const OrderReturnSheet(returnOrder),
  );
}

void addProduct() {
  print("Add Product");
}

void returnOrder() {
  print("return order");
}
