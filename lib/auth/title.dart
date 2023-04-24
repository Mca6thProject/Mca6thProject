import 'package:flutter/material.dart';

Widget ScreenTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      title,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  );
}
