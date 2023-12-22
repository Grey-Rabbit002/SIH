import 'package:ecorevs/utils/upper_card.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class StaticScreen extends StatelessWidget {

  StaticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardWidget(title: 'Bio Degradable', subtitle: 'subtitle'),
                CardWidget(title: 'Non Bio Degradable', subtitle: 'subtitle'),
                CardWidget(title: 'Mixed', subtitle: 'subtitle'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
