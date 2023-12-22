import 'package:ecorevs/screens/home_screen.dart';
import 'package:ecorevs/screens/static_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('EcoRevs'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Handle search icon press
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Handle profile icon press
                },
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Home(),
              StaticScreen(),
              Center(child: Text('Profile Screen Content')),
            ],
          ),
          bottomNavigationBar: SizedBox(
            // color: Colors.blue, // Set the background color of the bottom bar
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.radio_button_checked_outlined),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
              ],

              indicatorColor: Colors.green[400],
              labelColor:
                  Colors.green, // Set the color of the selected tab label
              unselectedLabelColor:
                  Colors.grey, // Set the color of unselected tab labels
            ),
          ),
        ));
  }
}
