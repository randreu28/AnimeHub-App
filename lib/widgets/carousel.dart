import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/models/anime.dart';

class Carousel extends StatelessWidget {
  final String title;
  final List<Anime>? animes;

  const Carousel({super.key, required this.title, required this.animes});

  @override
  Widget build(BuildContext context) {
    if (animes == null) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(
              height: 200.0, child: LoadingIndicator(size: 20, borderWidth: 1)),
        ],
      );
    }

    if (animes!.isEmpty) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(
            height: 200.0,
            width: 300,
            child: Center(
              child: Text(
                "You haven't watched any anime! Watch some and we'll be able to recommend you new ones",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          )
        ],
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 250.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final anime = animes![index];
              return GestureDetector(
                onTap: () {
                  /* TODO: Show specific anime screen */
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      anime.image!,
                      height: 200,
                    ),
                    SizedBox(
                      width: 130,
                      child: Text(
                        maxLines: 2,
                        anime.title!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 1, indent: 5);
            },
          ),
        ),
      ],
    );
  }
}
