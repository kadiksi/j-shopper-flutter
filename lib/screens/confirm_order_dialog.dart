import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';

class ConfirmOrderDialog extends StatelessWidget {
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
              const SizedBox(height: 20),

              const Icon(
                Icons.qr_code_rounded,
                color: Colors.orange,
                size: 60,
              ),
              const SizedBox(height: 10),

              const Text(
                'Принять отмеченные заказы?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              const Text(
                'Отмеченные заказы перейдут в статус «принятые»',
                style: TextStyle(color: Colors.grey),
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
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).accept_selected),
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: theme.elevatedButtonTheme.style!.copyWith(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.black12)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).cancel),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
