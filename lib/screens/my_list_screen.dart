import 'package:flutter/material.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';

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
              Column(
                children: [
                  //Image.network(anime!.image, height: 250),
                  Image.network(
                    fit: BoxFit.cover,
                    'https://cdn.myanimelist.net/images/anime/1471/128323.jpg',
                    height: 250,
                  ),

                  Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Column(
                      children: [
                        Column(
                          children: const [
                            Text("NAME",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2)),
                              child: Row(
                                children: const [
                                  Text(
                                    "TV",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(Icons.star_border, color: Colors.white),
                                  Text(
                                    "SCORE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(Icons.person, color: Colors.white),
                                  Text(
                                    "USERS",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
