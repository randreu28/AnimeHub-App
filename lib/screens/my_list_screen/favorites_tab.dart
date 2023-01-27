import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_grid.dart';
import 'package:p1_coronado/widgets/error_state.dart';
import 'package:p1_coronado/widgets/loading_state.dart';

class FavoritesTab extends ConsumerWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteAnimes = ref.watch(loadFavoriteIDsProvider);

    return favoriteAnimes.when(data: (favoriteAnimes) {
      if (favoriteAnimes.isEmpty) {
        return const Center(
          child: Text(
            "You don't have any favorite anime yet",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        );
      }
      return AnimeGrid(animes: favoriteAnimes);
    }, error: (error, stackTrace) {
      return ErrorState(error: error);
    }, loading: () {
      return const LoadingState();
    });
  }
}
