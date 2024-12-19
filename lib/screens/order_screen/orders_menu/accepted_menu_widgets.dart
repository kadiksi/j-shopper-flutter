import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/screens/product_screen/product_replacement_screen.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/cancel_order.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/return_order.dart';

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
