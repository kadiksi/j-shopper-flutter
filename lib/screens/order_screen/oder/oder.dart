import 'package:flutter/material.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/order_screen/oder/order_button.dart';
import 'package:j_courier/screens/order_screen/oder/order_info.dart';
import 'package:j_courier/screens/order_screen/oder/product_list.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget orderView(
  Task task,
  ThemeData theme,
  BuildContext context,
  List<int> selectedItems,
  void Function(VoidCallback fn) setState,
) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        buildOrderInfo(context, theme),
        divider16,
        Expanded(
            child: buildMultipleExpandableProductLists(
                task, theme, context, selectedItems, setState)),
        buildAcceptOrderButton(context),
        Column(
          children: [buildCollectedButton(context, selectedItems)],
        )
      ],
    ),
  );
}
