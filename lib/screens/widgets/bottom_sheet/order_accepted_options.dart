import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/option_button.dart';

void showAcceptedOrderOptions(
  BuildContext context,
  void Function(BuildContext, Function(Product product) addProduct)
      showModelAddProduct,
  void Function(BuildContext context, List<CancelationReasons> reasons,
          Function(String reason) action)
      showModelCancelProduct,
  List<CancelationReasons> reasons,
  void Function(BuildContext context, Function() returnOrder)
      showModelReturnOrder,
  final Function(String reason) cancelOrder,
  void Function(Product product) addProduct,
  final Function() returnOrder,
) {
  final theme = Theme.of(context);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 100),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildOptionItem(
                      context,
                      icon: 'assets/svg/add_order.svg',
                      text: S.of(context).add_product,
                      onTap: () => showModelAddProduct(context, addProduct),
                    ),
                    buildOptionItem(
                      context,
                      icon: 'assets/svg/cancel_order.svg',
                      text: S.of(context).cancel_order,
                      onTap: () =>
                          showModelCancelProduct(context, reasons, cancelOrder),
                    ),
                    buildOptionItem(
                      context,
                      icon: 'assets/svg/return_order.svg',
                      text: S.of(context).return_order,
                      onTap: () => showModelReturnOrder(context, returnOrder),
                    ),
                  ],
                )),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).cancel,
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            )
          ]));
    },
  );
}
