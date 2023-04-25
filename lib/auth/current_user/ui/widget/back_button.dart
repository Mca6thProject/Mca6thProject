import 'package:flutter/material.dart';

Widget backButton(BuildContext context) {
  return GestureDetector(
    onTap: (() {
      Navigator.pop(context);
    }),
    child: Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(148, 148, 148, 1),
      ),
      child: const Icon(
        Icons.close,
        color: Colors.white,
        size: 24,
      ),
    ),
  );
}

Widget backButtonArrow(BuildContext context) {
  return GestureDetector(
    onTap: (() {
      Navigator.pop(context);
    }),
    child: const Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 24,
    ),
  );
}
