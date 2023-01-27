import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/utilities/loaders.dart';

class GenrePicker extends ConsumerStatefulWidget {
  final List<int> genres;
  const GenrePicker({super.key, required this.genres});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenrePickerState();
}

class _GenrePickerState extends ConsumerState<GenrePicker> {
  @override
  Widget build(BuildContext context) {
    final genreLoader = ref.watch(loadGenresProvider);

    return genreLoader.when(
      data: (allGenres) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Select the genre's"),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        widget.genres.clear();
                      });
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.teal),
                    ))
              ],
              leading: GestureDetector(
                child: const Icon(
                  Icons.arrow_back,
                ),
                onTap: () {
                  Navigator.of(context).pop(widget.genres);
                },
              ),
            ),
            body: ListView(
              children: [
                for (final genre in allGenres.keys) ...[
                  CheckboxListTile(
                    title: Text(genre),
                    value: widget.genres.any((id) => allGenres[genre] == id),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          widget.genres.add(allGenres[genre]!);
                        } else {
                          widget.genres.remove(allGenres[genre]!);
                        }
                      });
                    },
                  )
                ],
              ],
            ));
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
