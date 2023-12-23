// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

class HamBurger extends StatefulWidget {
  const HamBurger({super.key});

  @override
  State<HamBurger> createState() => _HamBurgerState();
}

class _HamBurgerState extends State<HamBurger> {
  String selectedOption = '';

  Future<void> storeDataToFirestore() async {
    // Replace 'your_collection' with the name of your Firebase collection
    CollectionReference collection =
        FirebaseFirestore.instance.collection('choice');

    // Store data in Firestore
    await collection.add({
      'selectedOption': selectedOption,
    });

    // Display a success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data Stored'),
          content: const Text('Selected sector marked'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EcoRevs",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 4),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select your Sector",
              style: TextStyle(
                  fontSize: 20, fontStyle: FontStyle.italic, letterSpacing: 4),
            ),
            const SizedBox(
              height: 50,
            ),
            buildOptionButton('Corporate'),
            buildOptionButton('Hospital'),
            buildOptionButton('Railway Station'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                if (selectedOption.isNotEmpty) {
                  storeDataToFirestore();
                } else {
                  // Display a message if no option is selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please select an option.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Add your option'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionButton(String option) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedOption = option;
        });
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(300, 30),
          backgroundColor: selectedOption == option
              ? Colors.green // Color for selected option
              : Colors.grey), // Default color
      child: Text(
        option,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
