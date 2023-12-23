// ignore_for_file: depend_on_referenced_packages

import 'package:ecorevs/services/fetch.dart';
import 'package:ecorevs/services/update.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ecorevs/utils/colorlabel.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  List<double> fieldValues = [44, 44, 44];
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FetchData fetchData = FetchData();
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/videos/f.mp4');
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeVideoPlayerFuture.then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<double> myList = Provider.of<GlobalData>(context).Lister;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: fetchData.firestoreInstance
              .collection(
                  'distance_data') // Order by timestamp in descending order
              .limit(3)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
                snapshot.data!.docs;
            widget.fieldValues.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> document
                in documents) {
              final Map<String, dynamic> data = document.data();
              final double distance = (data['distance'] as num?)?.toDouble() ??
                  0.0; // Replace with your field name

              // Add the distance to the list
              widget.fieldValues.add(((44 - distance) / 44) * 100);

              // print("/////////////////////////////////////");
              // print(widget.fieldValues);
            }
            Provider.of<GlobalData>(context, listen: false)
                .updateList(widget.fieldValues);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Simplify Waste, Amplify Green",
                    style: TextStyle(color: Colors.green[700], fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Center(
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child:
                                          VideoPlayer(_videoPlayerController),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: SizedBox(
                      width: 250,
                      child: Divider(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Bar Chart",
                      style: TextStyle(color: Colors.green[700], fontSize: 18)),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceEvenly,
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(
                              color: Colors
                                  .black, // Adjust the color of the left border
                              width: 1.0, // Adjust the width of the left border
                            ),
                            bottom: BorderSide(
                              color: Colors
                                  .black, // Adjust the color of the bottom border
                              width:
                                  1.0, // Adjust the width of the bottom border
                            ),
                          ),
                        ),
                        titlesData: const FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles:
                                      false)), // Set showTitles to false to hide bottom titles
                        ),
                        barGroups: List.generate(
                          widget.fieldValues.length,
                          (index) => BarChartGroupData(
                            barsSpace: 44,
                            x: index,
                            barRods: [
                              BarChartRodData(
                                width: 25,
                                borderRadius: BorderRadius.circular(4.0),
                                toY: widget.fieldValues[index],
                                color: [
                                  Colors.blue,
                                  Colors.green,
                                  Colors.orange
                                ][index % 3],
                              ),
                            ],
                          ),
                        ),
                        groupsSpace: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColorLabel(
                              color: Colors.blue, label: 'Bio degradable'),
                          ColorLabel(
                              color: Colors.green, label: 'Non Bio degradable'),
                          ColorLabel(
                              color: Colors.orange,
                              label: 'Non Bio degradable'),
                        ],
                      )
                    ],
                  ) // Add spacing between chart and color labels
                ],
              ),
            );
          }),
    );
  }
}
