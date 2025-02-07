import 'package:flutter/material.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/screens/order_screen/accepted/accepted_order/accepted_oder.dart';

class AcceptedOrderScreen extends StatefulWidget {
  const AcceptedOrderScreen({
    super.key,
    required this.task,
    required this.productStatus,
    required this.shelfs,
    required this.changeProductStatus,
    required this.sendToDelivery,
  });

  final Task task;
  final List<Shelf> shelfs;
  final ProductStatus productStatus;
  final void Function(List<Product> products, String status)
      changeProductStatus;
  final VoidCallback sendToDelivery;

  @override
  State<AcceptedOrderScreen> createState() => _AcceptedOrderScreenState();
}

class _AcceptedOrderScreenState extends State<AcceptedOrderScreen> {
  final List<Product> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: acceptedOrderView(
        widget.task,
        widget.shelfs,
        Theme.of(context),
        context,
        selectedItems,
        widget.productStatus,
        setState,
        widget.changeProductStatus,
        widget.sendToDelivery,
      ),
    );
  }
}
