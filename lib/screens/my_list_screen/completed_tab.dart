import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_grid.dart';
import 'package:p1_coronado/widgets/error_state.dart';
import 'package:p1_coronado/widgets/loading_state.dart';

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
        return ErrorState(error: error);
      },
      loading: () {
        return const LoadingState();
      },
    );
  }
}
