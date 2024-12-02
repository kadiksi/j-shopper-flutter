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
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/product_screen/product_replacement_screen.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/cancel_order.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/order_options.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/return_order.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';

@RoutePage()
class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildOrderInfo(context, theme),
                    divider16,
                    Expanded(
                        child: _buildMultipleExpandableProductLists(state.tasks,
                            theme, context, selectedItems, setState)),
                    _buildAcceptOrderButton(context),
                    Column(
                      children: [_buildCollectedButton(context, selectedItems)],
                    )
                  ],
                ),
              );
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

Widget _buildOrderInfo(BuildContext context, ThemeData theme) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Диана Ш.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.orange),
                SizedBox(width: 4),
                Text('13:00 - 18:00', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        divider4,
        Text('Плановая дата 24.09.24',
            style: TextStyle(color: Colors.grey[600])),
        divider8,
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).call,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    ),
  );
}

Widget _buildMultipleExpandableProductLists(
  Task task,
  ThemeData theme,
  BuildContext context,
  List<int> selectedItems,
  void Function(VoidCallback fn) setState,
) {
  final categoryProducts = [
    'Молочные продукты',
    'Завершено 6 из 8',
    'Молочные продукты',
    'Завершено 6 из 8'
  ];
  List<Widget> views = [];
  for (var element in categoryProducts) {
    List<Product> products = List.empty();

    views.add(ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      initiallyExpanded: false,
      title: Text(element, style: theme.textTheme.bodyMedium),
      subtitle:
          Text('Завершено 6 из 8 Subtitle', style: theme.textTheme.bodySmall),
      children: products.map((product) {
        final isSelected = selectedItems.contains(product.jmartProductId);
        return GestureDetector(
            onLongPress: () {
              if (selectedItems.isEmpty) {
                setState(() {
                  selectedItems.add(product.jmartProductId!);
                });
              }
            },
            onTap: () {
              if (selectedItems.isNotEmpty) {
                setState(() {
                  if (isSelected) {
                    selectedItems.remove(product.jmartProductId!);
                  } else {
                    selectedItems.add(product.jmartProductId!);
                  }
                });
              } else {
                AutoRouter.of(context).push(ProductRoute(product: product));
              }
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: Icon(
                Icons.check_circle,
                color: isSelected ? Colors.lightGreenAccent : null,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ('№ ${product.jmartProductId}'),
                            style: theme.textTheme.bodyLarge,
                          ),
                          Text(
                            '${product.productName}',
                            style: theme.textTheme.bodyMedium,
                          ),
                          divider8,
                          Text(
                            '${product.price}',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text('1534₸ x 4 ш  т'),
                    ],
                  ),
                ],
              ),
              trailing: Image.network(
                'https://images.igdb.com/igdb/image/upload/t_cover_big/ss6bi7081my4mzebjkzb.png',
                width: 62,
                height: 62,
              ),
            ));
      }).toList(),
    ));
  }

  return ListView(
    children: views,
  );
}

Widget _buildAcceptOrderButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      child: Text(S.of(context).accept_orders),
    ),
  );
}

Widget _buildCollectedButton(BuildContext context, List<int> selectedItems) {
  final theme = Theme.of(context);
  if (selectedItems.isNotEmpty) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: ElevatedButton(
              onPressed: () {},
              style: theme.elevatedButtonTheme.style!.copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.black12)),
              child: Text(S.of(context).not_exist)),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(S.of(context).accept_orders),
          ),
        )
      ],
    );
  } else {
    return divider;
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
