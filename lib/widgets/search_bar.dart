import 'package:flutter/material.dart';
import 'package:p1_coronado/screens/genre_picker.dart';
import 'package:p1_coronado/screens/search_results_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController query = TextEditingController();
  List<int> genresID = [];

  @override
  void dispose() {
    query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void selectGenre() {
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => GenrePicker(genres: genresID),
        ),
      )
          .then((newGenres) {
        if (newGenres != null) {
          setState(() {
            genresID = newGenres;
          });
        }
      });
    }

    void search(_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultScreen(
            genresID: genresID,
            query: query.text,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
          controller: query,
          onSubmitted: search,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.teal,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.tune, color: Colors.teal),
              onPressed: selectGenre,
            ),
          )),
    );
  }
}
