import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../box_decorations/dividers.dart';

class SwapConfirmationDialog extends StatelessWidget {
  SwapConfirmationDialog(
      {super.key,
      required this.title,
      required this.tip,
      required this.action,
      required this.buttonText,
      required this.icon});

  final String title;
  final String tip;
  final String buttonText;
  final String icon;
  final VoidCallback action;

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
              SvgPicture.asset(
                icon,
                width: 80,
                height: 80,
              ),
              divider10,

              Text(
                title,
                style: theme.textTheme.bodyLarge,
              ),
              divider10,
              // Subtitle
              Text(
                tip,
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
                      action();
                      Navigator.of(context).pop();
                    },
                    child: Text(buttonText),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
