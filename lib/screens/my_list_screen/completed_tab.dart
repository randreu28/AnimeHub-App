import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_grid.dart';

class CompletedTab extends ConsumerWidget {
  const CompletedTab({super.key});

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
              "You haven't completed any anime yet",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          );
        }
        return AnimeGrid(animes: watchedAnimes);
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
