import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildOrderInfo(BuildContext context, ThemeData theme) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Диана Ш.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.orange),
                SizedBox(width: 4),
                Text('13:00 - 18:00', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        divider4,
        Text('Плановая дата 24.09.24',
            style: TextStyle(color: Colors.grey[600])),
        divider8,
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).call,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    ),
  );
}
