import 'package:flutter/material.dart';
import 'package:p1/product_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Second Screen"),
          onPressed: () {
            // 1. Saltem a la pantalla SecondScreen i la posem a sobre
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProductPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
