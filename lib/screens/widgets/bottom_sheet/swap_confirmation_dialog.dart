import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';

import '../box_decorations/dividers.dart';

class SwapConfirmationDialog extends StatelessWidget {
  SwapConfirmationDialog({super.key, required this.callback});

  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              divider20,

              const Icon(
                Icons.qr_code_rounded,
                color: Colors.orange,
                size: 60,
              ),
              divider10,

              Text(
                S.of(context).replace_product_confirmation_question,
                style: theme.textTheme.bodyLarge,
              ),
              divider10,
              // Subtitle
              Text(
                S.of(context).Replacement_of_good_will_result,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      callback('This is message from bottom sheet');
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).replace_product),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
