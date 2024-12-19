import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildOptionItem(
  BuildContext context, {
  required String icon,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
          SvgPicture.asset(
            'assets/svg/arrow_order.svg',
            width: 24,
            height: 24,
          ),
        ],
      ),
    ),
  );
}
