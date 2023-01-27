import 'package:flutter/material.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:p1_coronado/widgets/carousel.dart';
import 'package:p1_coronado/widgets/r_carousel.dart';
import 'package:p1_coronado/widgets/search_bar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchBar(),
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
