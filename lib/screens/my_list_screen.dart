import 'package:flutter/material.dart';
import 'package:p1_coronado/models/anime.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  Anime? anime;

  @override
  void initState() {
    loadAnime(1).then((newAnime) {
      setState(() {
        anime = newAnime;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (anime == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Column(
            children: const [Text("MYLIST")],
          ),
          Row(
            children: [
              Image.network(anime!.image!, height: 250),
            ],
          ),
        ],
      ),
    );
  }
}
