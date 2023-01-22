import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_card.dart';

class WatchedTab extends ConsumerWidget {
  const WatchedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchedAnimes = ref.watch(loadStatusIDsProvider(
      status: AnimeStatus.completed,
    ));

    return watchedAnimes.when(
      data: (watchedAnimes) {
        if (watchedAnimes.isEmpty) {
          return const Center(
            child: Text(
              "You are not watching any anime yet",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          );
        }
        return Scaffold(
          body: GridView.count(
            padding: const EdgeInsets.all(5),
            crossAxisCount: 2,
            childAspectRatio: 225 / 400, //Sizes of all images + text,
            children: [
              for (final id in watchedAnimes) ...[AnimeCard(animeID: id)],
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            "An error has occured. Please try again later. ($error)",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, color: Colors.red),
          ),
        );
      },
      loading: () {
        return const Center(
          child: SizedBox(
              height: 200.0, child: LoadingIndicator(size: 20, borderWidth: 1)),
        );
      },
    );
  }
}
