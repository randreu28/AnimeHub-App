import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: const [Text("MYLIST")],
          ),
          Row(
            children: [
              Image.network(
                  "https://cdn.myanimelist.net/images/anime/1471/128323.jpg",
                  height: 250),
            ],
          ),
        ],
      ),
    );
  }
}
