// ignore_for_file: depend_on_referenced_packages

import 'package:ecorevs/services/update.dart';
import 'package:ecorevs/utils/custom_card.dart';
import 'package:ecorevs/utils/monthly.dart';
import 'package:ecorevs/utils/upper_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaticScreen extends StatelessWidget {
  const StaticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> myList = Provider.of<GlobalData>(context).lister;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardWidget(
                      title: 'Bio Degradable', subtitle: myList[0].toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  CardWidget(
                      title: 'Non Bio Degradable',
                      subtitle: myList[1].toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  CardWidget(
                      title: 'Mixed',
                      subtitle: (100 - (myList[2] + myList[1])).toString()),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "If any container is filled Envac wil be notified about it for garbage collection",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("First Container",
                style: TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCard(text: 'Bio Degradable', onTap: () {}),
                  CustomCard(text: 'Non BioDegradable', onTap: () {}),
                  CustomCard(text: 'Recyclable', onTap: () {}),
                  CustomCard(text: 'Non Recyclable', onTap: () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Second Container",
                style: TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCard(text: 'Bio Degradable', onTap: () {}),
                  CustomCard(text: 'Non BioDegradable', onTap: () {}),
                  CustomCard(text: 'Recyclable', onTap: () {}),
                  CustomCard(text: 'Non Recyclable', onTap: () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Monthly Garbage Collection",
                style: TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomMCard(
                      title: 'This Month',
                      row1Label: 'Bio Degradable',
                      row1Value: '16',
                      row1Unit: 'kg',
                      row2Label: 'Bio Degradable',
                      row2Value: '18',
                      row2Unit: 'kg',
                      row3Label: 'Mixed Waste',
                      row3Value: '16',
                      row3Unit: 'kg'),
                  CustomMCard(
                      title: 'November',
                      row1Label: 'Bio Degradable',
                      row1Value: '15',
                      row1Unit: 'kg',
                      row2Label: 'Bio Degradable',
                      row2Value: '14',
                      row2Unit: 'kg',
                      row3Label: 'Mixed Waste',
                      row3Value: '17',
                      row3Unit: 'kg'),
                  CustomMCard(
                      title: 'October',
                      row1Label: 'Bio Degradable',
                      row1Value: '14',
                      row1Unit: 'kg',
                      row2Label: 'Bio Degradable',
                      row2Value: '16',
                      row2Unit: 'kg',
                      row3Label: 'Mixed Waste',
                      row3Value: '19',
                      row3Unit: 'kg'),
                  CustomMCard(
                      title: 'September',
                      row1Label: 'Bio Degradable',
                      row1Value: '13',
                      row1Unit: 'kg',
                      row2Label: 'Bio Degradable',
                      row2Value: '18',
                      row2Unit: 'kg',
                      row3Label: 'Mixed Waste',
                      row3Value: '12',
                      row3Unit: 'kg'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
