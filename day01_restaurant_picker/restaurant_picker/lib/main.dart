import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    'McDonald\'s',
    'Burger King',
    'Pizza Hut',
    'KFC',
    'Olive Garden',
    'Panda Express',
    'Subway'
  ];

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What do you wnat to eat?'),
            if (currentIndex != null)
              Text(
                restaurants[currentIndex],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.yellow.shade600),
              onPressed: () {
                updateIndex();
              },
              child: Text('Pick Restaurant'),
            )
          ],
        )),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
