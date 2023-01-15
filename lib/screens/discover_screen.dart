import 'package:flutter/material.dart';
import 'package:p1_coronado/models/anime.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/carousel.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String query = "";
  List<Anime>? topAnimes;
  List<Anime>? upcomingSeasons;
  List<Anime>? recommended;

  onInit() async {
    final newTopAnimes = await loadTopAnimes();
    final newUpcomingSeasons = await loadUpcomingSeasons();
    final newRandomWatchingAnime = await loadRandomWatchingAnime();
    List<Anime> newRecommendations = [];

    if (newRandomWatchingAnime != 0) {
      newRecommendations = await loadRecommendations(newRandomWatchingAnime);
    }

    if (mounted) {
      setState(() {
        topAnimes = newTopAnimes;
        upcomingSeasons = newUpcomingSeasons;
        recommended = newRecommendations;
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
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              onSubmitted: (value) {
                /* TODO: Search anime and display it */
              },
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  splashColor: Colors.white,
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    /* TODO: Search by genre */
                  },
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Carousel(title: "Recommended for you", animes: recommended),
              Carousel(title: "Top Animes", animes: topAnimes),
              Carousel(title: "Upcoming Seasons", animes: upcomingSeasons),
            ],
          ),
        ),
      ],
    );
  }
}
