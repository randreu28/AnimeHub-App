import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_card.dart';
import 'package:p1_coronado/widgets/error_state.dart';
import 'package:p1_coronado/widgets/loading_state.dart';
import 'package:p1_coronado/widgets/search_bar.dart';

class SearchResultScreen extends ConsumerWidget {
  final String query;
  final List<int> genresID;
  const SearchResultScreen(
      {super.key, required this.query, required this.genresID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchAnimeLoader = ref.watch(loadAnimeSearchProvider(
      genresID: genresID,
      query: query,
    ));

    return searchAnimeLoader.when(
      data: (searchedAnimes) {
        if (searchedAnimes.isEmpty) {
          return Layout(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("No results for: "),
                  Text(
                    query,
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          );
        }
        return Layout(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Results for: "),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      query,
                      style: const TextStyle(color: Colors.teal),
                    )
                  ],
                ),
              ),
              const SearchBar(),
              GridView.count(
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.all(5),
                crossAxisCount: 2,
                childAspectRatio: 225 / 420,
                shrinkWrap: true,
                children: [
                  for (final anime in searchedAnimes) ...[
                    if (anime != null) AnimeCard(anime: anime)
                  ]
                ],
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Layout(child: ErrorState(error: error));
      },
      loading: () {
        return const Layout(child: LoadingState());
      },
    );
  }
}

class Layout extends StatelessWidget {
  final Widget child;
  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search results"),
        ),
        body: child);
  }
}
