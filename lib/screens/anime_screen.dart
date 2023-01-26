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
          appBar: AppBar(
              title: Row(
            children: [
              Text(anime.title!),
              const Spacer(),
              Image.network(
                'https://scontent-mad1-2.xx.fbcdn.net/v/t39.30808-6/326580897_525254782918807_8636374389209684298_n.png?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=cbl8gn7bAfYAX9CjjQt&_nc_ht=scontent-mad1-2.xx&oh=00_AfBBK6gaevkPMYg0Y11-Q1V-EDkRDtVK4R7laduV9uVgHg&oe=63D7204B',
                height: 30,
              ),
              const Spacer(),
              const Icon(Icons.favorite)
            ],
          )),
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
                        child: Image.network(anime.image!),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
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
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(anime.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(3)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Watching // TO DO"),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  color: Colors.grey.shade900.withOpacity(0.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          anime.airingStatus.toString(),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(anime.episodes.toString()),
                        const Text(" ep"),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        anime.genres!.join("    ·   "),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.teal),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(anime.synopsis!),
                ),
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
