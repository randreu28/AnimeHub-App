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
          body: const Center(child: Text("WIP")), /* TODO */
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
