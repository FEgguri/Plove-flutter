import 'package:flutter/material.dart';
import 'home_screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(

        child: HomeScreen(
        ),
      ),
    ),
  );
}