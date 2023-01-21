import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/anime_card.dart';

class WatchingTab extends StatefulWidget {
  const WatchingTab({
    Key? key,
  }) : super(key: key);

  @override
  State<WatchingTab> createState() => _WatchingTabState();
}

class _WatchingTabState extends State<WatchingTab> {
  List<Anime>? watchingAnimes;

  onInit() async {
    final incomingAnimes = await loadTopAnimes();

    if (mounted) {
      setState(() {
        watchingAnimes = incomingAnimes;
      });
    }
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (watchingAnimes == null) {
      return const Center(
        child: LoadingIndicator(size: 20, borderWidth: 1),
      );
    }

    if (watchingAnimes!.isEmpty) {
      return const Center(
        child: Text("You have no watching animes"),
      );
    }

    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(5),
        crossAxisCount: 2,
        childAspectRatio: 225 / 400, //Sizes of all images + text,
        children: [
          for (final anime in watchingAnimes!) ...[AnimeCard(anime: anime)],
        ],
      ),
    );
  }
}
