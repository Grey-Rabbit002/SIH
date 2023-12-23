import 'package:ecorevs/services/update.dart';
import 'package:ecorevs/utils/upper_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class StaticScreen extends StatelessWidget {
  StaticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> myList = Provider.of<GlobalData>(context).Lister;
    print("dgdgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdf");
    print(myList);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardWidget(
                    title: 'Bio Degradable', subtitle: myList[0].toString()),
                CardWidget(
                    title: 'Non Bio Degradable',
                    subtitle: myList[1].toString()),
                CardWidget(
                    title: 'Mixed',
                    subtitle: (100 - (myList[2] + myList[1])).toString()),
                Text(myList.first.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
