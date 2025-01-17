import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildAcceptOrderButton(BuildContext context, void Function() accept) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        accept();
      },
      child: Text(S.of(context).accept_orders),
    ),
  );
}

Widget buildSendToDeliveryButton(
    BuildContext context, void Function() sendToDelivery) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        sendToDelivery();
      },
      child: Text(S.of(context).send_to_delivery),
    ),
  );
}

Widget buildCollectedButton(
    BuildContext context,
    List<Product> selectedItems,
    void Function(List<Product> products) collect,
    void Function(List<Product> products) doNotExist) {
  final theme = Theme.of(context);
  if (selectedItems.isNotEmpty) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: ElevatedButton(
              onPressed: () {
                doNotExist(selectedItems);
              },
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
            onPressed: () {
              collect(selectedItems);
            },
            child: Text(S.of(context).collect),
          ),
        )
      ],
    );
  } else {
    return divider;
  }
}
