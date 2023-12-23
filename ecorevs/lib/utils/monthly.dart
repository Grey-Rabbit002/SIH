import 'package:flutter/material.dart';

class CustomMCard extends StatelessWidget {
  final String title;
  final String row1Label;
  final String row1Value;
  final String row1Unit;
  final String row2Label;
  final String row2Value;
  final String row2Unit;
  final String row3Label;
  final String row3Value;
  final String row3Unit;

  CustomMCard({
    required this.title,
    required this.row1Label,
    required this.row1Value,
    required this.row1Unit,
    required this.row2Label,
    required this.row2Value,
    required this.row2Unit,
    required this.row3Label,
    required this.row3Value,
    required this.row3Unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            buildRow(row1Label, '$row1Value $row1Unit'),
            buildRow(row2Label, '$row2Value $row2Unit'),
            buildRow(row3Label, '$row3Value $row3Unit'),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16.0)),
        const SizedBox(
          width: 12,
        ),
        Text(value, style: TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
