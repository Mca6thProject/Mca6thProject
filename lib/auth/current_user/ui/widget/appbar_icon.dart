import 'package:flutter/material.dart';

Widget appBarIcon(
  IconData icon,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                color: Colors.grey.shade200, style: BorderStyle.solid),
            shape: BoxShape.circle),
        child: Icon(icon, color: Colors.grey[700], size: 22)),
  );
}
