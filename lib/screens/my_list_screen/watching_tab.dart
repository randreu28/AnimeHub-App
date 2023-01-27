import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_grid.dart';
import 'package:p1_coronado/widgets/error_state.dart';

class WatchingTab extends ConsumerWidget {
  const WatchingTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchingAnimes =
        ref.watch(loadStatusIDsProvider(status: AnimeStatus.watching));

    return watchingAnimes.when(
      data: (watchingAnimes) {
        if (watchingAnimes.isEmpty) {
          return const Center(
            child: Text(
              "You are not watching any anime yet",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          );
        }
        return AnimeGrid(animes: watchingAnimes);
      },
      error: (error, stackTrace) {
        return ErrorState(error: error);
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
