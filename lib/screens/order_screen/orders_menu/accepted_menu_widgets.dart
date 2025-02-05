import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/screens/product_screen/product_add_screen.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/cancel_order.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/return_order.dart';

void showModelAddProduct(
    BuildContext context, final Function(Product product) action) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) =>
        ProductAddSheet(addProduct: action, title: S.of(context).add_product),
  );
}

// void showModelAddProduct(
//     BuildContext context, final Function(String reason) action) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (context) => ProductReplacementSheet(
//         isReplace: false,
//         action: confirmProductAdd,
//         title: S.of(context).add_product),
//   );
// }

void showModelCancelOrder(
    BuildContext context,
    List<CancelationReasons> reasons,
    final Function(String reason) cancelOrder) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) =>
        ReasonSelectionSheet(cancelOrder: cancelOrder, reasons: reasons),
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

// void confirmProductAdd(Product product) {
//   print("Add confirmProductSwap");
// }

// void confirmProductAdd(Product product) {
//   print("Add Product");
// }

void returnOrder() {
  print("return order");
}
