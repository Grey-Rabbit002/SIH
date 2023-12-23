import 'package:flutter/material.dart';
class ColorLabel extends StatelessWidget {
  final Color color;
  final String label;

  const ColorLabel({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
