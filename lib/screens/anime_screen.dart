import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/utilities/setters.dart';
import 'package:p1_coronado/widgets/error_state.dart';
import 'package:p1_coronado/widgets/loading_state.dart';

class AnimeScreen extends ConsumerStatefulWidget {
  final int animeID;
  const AnimeScreen({super.key, required this.animeID});

  @override
  ConsumerState<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends ConsumerState<AnimeScreen> {
  @override
  Widget build(BuildContext context) {
    final animeLoader = ref.watch(loadAnimeProvider(
      animeID: widget.animeID,
      hasDbData: true,
    ));

    return animeLoader.when(
      data: (anime) {
        String genre;

        if (anime.genres == null) {
          genre = "This anime has no genre's";
        }

        if (anime.genres!.length >= 4) {
          final threeGenres = anime.genres!.take(3).join("  ·  ");
          genre = "$threeGenres  and more";
        } else {
          genre = anime.genres!.join("  ·  ");
        }

        Widget statusIcon;
        String statusLabel;
        AnimeStatus newStatus;

        switch (anime.status) {
          case AnimeStatus.completed:
            statusIcon = const Icon(Icons.tv_outlined);
            statusLabel = "Completed";
            newStatus = AnimeStatus.notWatched;
            break;
          case AnimeStatus.notWatched:
            statusIcon = const Icon(Icons.tv_off_rounded);
            statusLabel = "Not watched";
            newStatus = AnimeStatus.watching;
            break;
          case AnimeStatus.watching:
            statusIcon = const Icon(Icons.live_tv);
            statusLabel = "Watching";
            newStatus = AnimeStatus.completed;
            break;
        }

        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              try {
                setStatus(animeId: anime.id!, status: newStatus);
              } finally {
                setState(() {
                  anime.status = newStatus;
                });
              }
            },
            label: Text(statusLabel),
            icon: statusIcon,
            backgroundColor: Colors.teal,
          ),
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  anime.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 35,
                ),
                onPressed: () {
                  try {
                    setIsFavorite(
                        animeId: anime.id!, isFavorite: !anime.isFavorite);
                  } finally {
                    setState(() {
                      anime.isFavorite = !anime.isFavorite;
                    });
                  }
                },
              )
            ],
            title: Text(
                anime.title != null ? anime.title! : "No title for this Anime"),
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
                          : "No title for this Anime",
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
                                : "No",
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
                      : "No synopsis for this Anime"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ]),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: ErrorState(error: error),
        );
      },
      loading: () {
        return const Scaffold(body: LoadingState());
      },
    );
  }
}
