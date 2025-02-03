import 'package:flutter/material.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/order_screen/order/order_button.dart';
import 'package:j_courier/screens/order_screen/order/order_info.dart';
import 'package:j_courier/screens/order_screen/order/product_list.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget newOrderView(
    Task task,
    List<Shelf> shelfs,
    ThemeData theme,
    BuildContext context,
    List<Product> selectedItems,
    ProductStatus productStatus,
    void Function(VoidCallback fn) setState,
    void Function() accept) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        buildOrderInfo(context, theme, task),
        divider16,
        Expanded(
            child: buildMultipleExpandableProductLists(task, shelfs, theme,
                context, selectedItems, productStatus, setState)),
        buildAcceptOrderButton(context, accept),
        Column(
            // children: [buildCollectedButton(context, selectedItems)],
            )
      ],
    ),
  );
}
