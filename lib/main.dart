import 'package:flutter/material.dart';
import 'package:p1/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProductPage(),
      theme: ThemeData.dark().copyWith(
        primaryColorDark: const Color.fromARGB(255, 30, 32, 38), //Clar
        backgroundColor: const Color.fromARGB(255, 41, 46, 60), //Fosc
        highlightColor: const Color.fromARGB(255, 124, 64, 255),
      ),
    );
  }
}
