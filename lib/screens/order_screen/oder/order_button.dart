import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildAcceptOrderButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      child: Text(S.of(context).accept_orders),
    ),
  );
}

Widget buildCollectedButton(BuildContext context, List<int> selectedItems) {
  final theme = Theme.of(context);
  if (selectedItems.isNotEmpty) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: ElevatedButton(
              onPressed: () {},
              style: theme.elevatedButtonTheme.style!.copyWith(
                  backgroundColor: WidgetStateProperty.all(
                      theme.colorScheme.secondaryContainer)),
              child: Text(
                S.of(context).not_exist,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              )),
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(S.of(context).collect),
          ),
        )
      ],
    );
  } else {
    return divider;
  }
}
