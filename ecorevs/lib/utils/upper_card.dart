import 'package:ecorevs/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardWidget({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: 100,
      width: 200, // Set the width of each card as needed
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
