import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

class OrderReturnSheet extends StatelessWidget {
  const OrderReturnSheet(this.returnOrder, {super.key});
  final VoidCallback returnOrder;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/svg/qr_add_order.svg',
            width: 80,
            height: 80,
          ),
          divider16,
          Text(S.of(context).return_order_question,
              style: theme.textTheme.bodyLarge),
          divider8,
          Text(
            S.of(context).return_order_tip,
            style: theme.textTheme.bodyMedium,
          ),
          divider24,
          Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      returnOrder();
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).return_order),
                  )),
            ],
          ),
          divider8,
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
                  Text(S.of(context).cancel, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
