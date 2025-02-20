import 'package:flutter/material.dart';
import 'package:j_courier/models/tasks/product.dart';

Widget getProductLabel(Product product) {
  if (product.productType == ProductType.ORIGINAL) {
    return Container();
  }
  var color = Colors.green;
  var text = 'Добавлен';
  if (product.productType == ProductType.REPLACED) {
    color = Colors.orange;
    text = 'Заменен';
  } else {
    color = Colors.green;
    text = 'Добавлен';
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 14),
    ),
  );
}
