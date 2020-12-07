import 'dart:math';

import 'package:flutter/material.dart';
import 'constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Title here'),
          ),
          body: ColorScreen(),
        ),
        debugShowCheckedModeBanner: false);
  }
}

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int index = 0;
  int prevIndex = 0;
  int randomLimit = Constants.colors.length - 1;

  void _changeColor() {
    setState(() {
      int newIndex = new Random().nextInt(randomLimit);
      if (newIndex == prevIndex && newIndex == randomLimit) {
        index = 0;
      } else if (newIndex == prevIndex) {
        index = newIndex + 1;
      } else {
        index = newIndex;
      }
      prevIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _changeColor,
        child: Center(
          child: Container(
            color: Constants.colors[index],
            child: Text('Hello there!',
            style: TextStyle(fontSize: 82.0, color: Colors.white)
            ),
            width: double.maxFinite,
            height: double.maxFinite,
            alignment: Alignment.center,
          ),
        )
    );
  }
}
