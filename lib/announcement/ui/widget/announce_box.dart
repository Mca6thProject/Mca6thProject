import 'package:flutter/material.dart';

class AnnouceCard extends StatelessWidget {
  const AnnouceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
