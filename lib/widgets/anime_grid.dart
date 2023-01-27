import 'package:flutter/material.dart';
import 'package:p1_coronado/widgets/anime_card.dart';

class AnimeGrid extends StatelessWidget {
  final List<int> animes;
  const AnimeGrid({super.key, required this.animes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(5),
        crossAxisCount: 2,
        childAspectRatio: 225 / 420, //Sizes of all images + text,
        children: [
          for (final id in animes) ...[ConsumerAnimeCard(animeID: id)],
        ],
      ),
    );
  }
}
