// import 'package:flutter/material.dart';

// class SwitchLabelWidget extends StatelessWidget {
//   final String label;
//   final bool isSwitched;
//   const SwitchLabelWidget({
//     required this.label, required this.isSwitched,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Switch(
//       value: isSwitched,
//       onChanged: (value) {
//         setState(() {
//           isSwitched = value;
//         });
//       },
//       activeColor: Colors.white, // Thumb color when active
//       activeTrackColor: Colors.green, // Green track when active
//       inactiveThumbColor: Colors.white, // Thumb color when inactive
//       inactiveTrackColor: Colors.grey[400], // Gray track when inactive
//     );
//   }
// }
