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
