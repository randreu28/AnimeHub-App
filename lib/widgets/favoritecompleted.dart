import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/anime.dart';

class FavoriteCompleted extends StatelessWidget {
  const FavoriteCompleted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = context.watch<Anime>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border(
          top: BorderSide(color: Colors.grey.shade400),
          bottom: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 55,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor:
                  anime.isFavorite ? Colors.red : Colors.grey.shade400,
              side: BorderSide(
                  width: 1,
                  color: anime.isFavorite ? Colors.red : Colors.grey.shade400)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Icon(Icons.favorite),
                const SizedBox(
                  width: 3,
                ),
                Text(anime.isFavorite ? "Favorited" : "Favorite")
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor:
                    anime.isCompleted ? Colors.green : Colors.blue.shade900,
                side: BorderSide(
                    width: 1,
                    color: anime.isCompleted
                        ? Colors.green
                        : Colors.blue.shade900)),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(anime.isCompleted ? "Watching" : "Completed"),
            )),
      ]),
    );
  }
}
