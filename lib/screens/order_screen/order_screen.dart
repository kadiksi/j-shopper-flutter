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
    _listBloc.add(LoadOrder(id: widget.task.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(S.of(context).order_number('${widget.task.id}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _listBloc.add(LoadOrder(id: widget.task.id));
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
                    const SizedBox(height: 16),
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try againg later',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _listBloc.add(LoadOrder(id: widget.task.id));
                      },
                      child: const Text('Try againg'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
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
                Text('13:00 - 15:00', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text('Плановая дата 24.09.24',
            style: TextStyle(color: Colors.grey[600])),
        const SizedBox(height: 8),
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
    List<Product> products = task.product ?? List.empty();

    views.add(ExpansionTile(
      childrenPadding: EdgeInsets.zero, // Set padding to zero to reduce space

      initiallyExpanded: false,
      title: Text(element, style: theme.textTheme.bodyMedium),
      subtitle:
          Text('Завершено 6 из 8 Subtitle', style: theme.textTheme.bodySmall),
      children: products.map((product) {
        final isSelected = selectedItems.contains(product.id);
        return GestureDetector(
            onLongPress: () {
              // First item can only be selected via long press
              if (selectedItems.length == 0) {
                setState(() {
                  selectedItems.add(product.id!);
                });
              }
            },
            onTap: () {
              // Other items can be selected by a tap, but the first item must be selected first
              if (selectedItems.length != 0) {
                setState(() {
                  if (isSelected) {
                    selectedItems.remove(product.id!);
                  } else {
                    selectedItems.add(product.id!);
                  }
                });
              }
            },
            child: ListTile(
              contentPadding: EdgeInsets.all(8.0),
              leading: Icon(
                Icons.check_circle,
                color:
                    isSelected ? Colors.lightGreenAccent : null, // Status icon
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
                            ('№ ${product.id}'),
                            style: theme.textTheme.bodyLarge,
                          ),
                          Text(
                            '${product.name}',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
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
  if (selectedItems.length > 0) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).not_exist),
              style: theme.elevatedButtonTheme.style!.copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.black12))),
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
    return const SizedBox();
  }
}
