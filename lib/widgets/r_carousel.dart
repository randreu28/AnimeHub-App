import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/error_state.dart';
import 'package:p1_coronado/widgets/loading_state.dart';

import '../screens/anime_screen.dart';

class RecommendedCarousel extends ConsumerWidget {
  final String title;
  const RecommendedCarousel({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadRandomCompletedAnimeProvider).when(
      data: (id) {
        if (id == 0) {
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
        return RecommendedCarouselWithId(id: id, title: title);
      },
      error: (error, stackTrace) {
        return ErrorState(error: error);
      },
      loading: () {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const LoadingState()
          ],
        );
      },
    );
  }
}

class RecommendedCarouselWithId extends ConsumerWidget {
  final int id;
  final String title;
  const RecommendedCarouselWithId(
      {super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadRecommendationsProvider(animeID: id)).when(
      data: (animes) {
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
                  final anime = animes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AnimeScreen(animeID: anime.id!),
                        ),
                      );
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
                itemCount: animes.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 1, indent: 5);
                },
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
            ErrorState(error: error)
          ],
        );
      },
      loading: () {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const LoadingState()
          ],
        );
      },
    );
  }
}
