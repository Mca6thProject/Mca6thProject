import 'package:flutter/material.dart';

Widget roundedContainer(
    {required Widget child, required double w, required double h}) {
  return Container(
    width: w,
    height: h,
    padding: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      // color: cardColor,
      borderRadius: BorderRadius.circular(6),
      // border: Border.all(width: 1, color: Colors.black54)
    ),
    child: child,
  );
}
