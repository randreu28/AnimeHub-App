import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/utilities/loaders.dart';

class AnimeScreen extends ConsumerWidget {
  final int animeID;
  const AnimeScreen({super.key, required this.animeID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeLoader = ref.watch(loadAnimeProvider(
      animeID: animeID,
      hasDbData: true,
    ));

    return animeLoader.when(
      data: (anime) {
        return Scaffold(
          appBar: AppBar(title: Text(anime.title!)),
          body: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.teal,
                      child: Image.network(anime.image!),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Score"),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(anime.score.toString()),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const SizedBox(height: 5),
                      const Text("Rank"),
                      Row(
                        children: [
                          const Text("#"),
                          Text(anime.rank.toString()),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text("Popularity"),
                      Row(
                        children: [
                          const Text("#"),
                          Text(anime.popularity.toString()),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text("Members"),
                      Text(anime.members.toString()),
                      const SizedBox(height: 5),
                      const Text("Favorites"),
                      Text(anime.favorites.toString()),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(anime.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                color: Colors.grey.shade900.withOpacity(0.5),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    anime.airingStatus.toString(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(anime.episodes.toString()),
                  const Text(" ep"),
                ]),
              )
            ],
          ), /* TODO */
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "An error has occured. Please try again later. ($error)",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: SizedBox(
                height: 200.0,
                child: LoadingIndicator(size: 20, borderWidth: 1)),
          ),
        );
      },
    );
  }
}
