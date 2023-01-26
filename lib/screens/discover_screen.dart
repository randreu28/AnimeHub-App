import 'package:flutter/material.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/carousel.dart';
import 'package:p1_coronado/widgets/r_carousel.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  TextEditingController query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
              controller: query,
              onSubmitted: (value) {
                /* TODO: Search anime and display it */
              },
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.teal,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, color: Colors.teal),
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
              const RecommendedCarousel(
                title: "Recommended for you",
              ),
              Carousel(
                title: "Top Animes",
                animes: loadTopAnimesProvider,
              ),
              Carousel(
                title: "Upcoming Seasons",
                animes: loadUpcomingSeasonsProvider,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
