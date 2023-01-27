import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/models/anime.dart';
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
        String genre;

        if (anime.genres == null) {
          genre = "null";
        }

        if (anime.genres!.length >= 4) {
          final threeGenres = anime.genres!.take(3).join("  ·  ");
          genre = "$threeGenres  and more";
        } else {
          genre = anime.genres!.join("  ·  ");
        }

        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // TODO: Cambiar de estado entre Watching, Completed, Not Watch
            },
            label: const Text("NOT WATCHED"),
            icon: //const Icon(Icons.live_tv),
                const Icon(Icons.tv_off_rounded),
            //const Icon(Icons.tv_outlined),
            backgroundColor: Colors.teal,
          ),
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  //TODO funcionality
                },
              )
            ],
            title: Text(
                anime.title != null ? anime.title! : "no title for this Anime"),
          ),
          body: ListView(children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.teal,
                        child: Image.network(
                          anime.image != null
                              ? anime.image!
                              : 'https://i.postimg.cc/zv414PTR/imagenot.png',
                          height: anime.image != null ? null : 300,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Score", style: TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 22,
                              ),
                              Text(
                                anime.score != null
                                    ? anime.score.toString()
                                    : "N/A",
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 10),
                          const Opacity(
                              opacity: 0.8,
                              child:
                                  Text("Rank", style: TextStyle(fontSize: 16))),
                          Row(
                            children: [
                              const Text("#", style: TextStyle(fontSize: 20)),
                              Text(
                                  anime.rank != null
                                      ? anime.rank.toString()
                                      : "N/A",
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Opacity(
                            opacity: 0.8,
                            child: Text("Popularity",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Row(
                            children: [
                              const Text("#", style: TextStyle(fontSize: 16)),
                              Text(
                                  anime.popularity != null
                                      ? anime.popularity.toString()
                                      : "N/A",
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Opacity(
                              opacity: 0.8,
                              child: Text("Members",
                                  style: TextStyle(fontSize: 16))),
                          Text(
                              anime.members != null
                                  ? anime.members.toString()
                                  : "N/A",
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 10),
                          const Opacity(
                            opacity: 0.8,
                            child: Text("Favorites",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Text(
                              anime.favorites != null
                                  ? anime.favorites.toString()
                                  : "N/A",
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 10.0),
                  child: Text(
                      textAlign: TextAlign.center,
                      anime.title != null
                          ? anime.title!
                          : "no title for this Anime",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  color: Colors.grey.shade900.withOpacity(0.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            anime.airingStatus != null
                                ? anime.airingStatus.toString()
                                : "no AiringStatus for this Anime",
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                            anime.episodes != null
                                ? anime.episodes.toString()
                                : "no",
                            style: const TextStyle(fontSize: 16)),
                        const Text(
                          " eps",
                          style: TextStyle(fontSize: 16),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        genre,
                        style: TextStyle(
                            fontSize: 16,
                            color: anime.genres != null
                                ? Colors.teal
                                : Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(anime.synopsis != null
                      ? anime.synopsis!
                      : "no synopsis for this Anime"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ]), /* TODO */
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
