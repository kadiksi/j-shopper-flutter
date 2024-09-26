import 'package:flutter/material.dart';

void showAlert(BuildContext context, String title, String alertContent) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(alertContent,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ));
}

// class OverlayDialog {
//   bool isOpen = false;
//   OverlayEntry? _overlayEntry;
//   String dialogText = 'Loading, please wait...';
//   bool showCloseButton = false;

//   void setDialogText(String newText, bool show) {
//     dialogText = newText;
//     showCloseButton = show;

//     if (isOpen) {
//       _overlayEntry?.markNeedsBuild();
//     }
//   }

//   void show(BuildContext context) {
//     isOpen = true;
//     _overlayEntry = OverlayEntry(
//       builder: (context) {
//         return Center(
//           child: Dialog(
//             backgroundColor: Colors.grey,
//             child: SizedBox(
//               height: 60.0,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Text(
//                     dialogText,
//                   ),
//                   !showCloseButton
//                       ? const SizedBox.shrink()
//                       : ElevatedButton(
//                           onPressed: () {
//                             // Close the dialog
//                             isOpen = false;
//                             _overlayEntry?.remove();
//                           },
//                           child: const Text('Close Dialog')),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     Overlay.of(context).insert(_overlayEntry!);
//   }
// }
