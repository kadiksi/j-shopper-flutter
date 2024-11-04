import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';

void showOrderOptions(
    BuildContext context,
    void Function(BuildContext context, List<Product> products)
        showModelAddProduct,
    List<Product> products,
    void Function(BuildContext context, List<String> reasons)
        showModelCancelProduct,
    List<String> reasons,
    void Function(BuildContext context) showModelReturnOrder) {
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
                    _buildOptionItem(
                      context,
                      icon: 'assets/svg/add_order.svg',
                      text: S.of(context).add_product,
                      onTap: () => showModelAddProduct(context, products),
                    ),
                    _buildOptionItem(
                      context,
                      icon: 'assets/svg/cancel_order.svg',
                      text: S.of(context).cancel_order,
                      onTap: () => showModelCancelProduct(context, reasons),
                    ),
                    _buildOptionItem(
                      context,
                      icon: 'assets/svg/return_order.svg',
                      text: S.of(context).return_order,
                      onTap: () => showModelReturnOrder(context),
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

Widget _buildOptionItem(
  BuildContext context, {
  required String icon,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
          SvgPicture.asset(
            'assets/svg/arrow_order.svg',
            width: 24,
            height: 24,
          ),
        ],
      ),
    ),
  );
}
