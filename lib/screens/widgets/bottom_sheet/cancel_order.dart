import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

class ReasonSelectionSheet extends StatefulWidget {
  final List<String> reasons;

  const ReasonSelectionSheet({super.key, required this.reasons});
  @override
  _ReasonSelectionSheetState createState() => _ReasonSelectionSheetState();
}

class _ReasonSelectionSheetState extends State<ReasonSelectionSheet> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(S.of(context).select_cancelation_reason,
              style: theme.textTheme.bodyLarge),
          divider16,
          DropdownButtonFormField<String>(
            hint: Text(S.of(context).choose),
            value: selectedReason,
            items: widget.reasons.map((String reason) {
              return DropdownMenuItem<String>(
                value: reason,
                child: Text(reason),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedReason = newValue;
              });
            },
          ),
          divider16,
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).send_to_delivery),
          ),
        ],
      ),
    );
  }
}
