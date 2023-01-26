import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/screens/anime_screen.dart';
import 'package:p1_coronado/utilities/loaders.dart';

class AnimeCard extends ConsumerWidget {
  final int animeID;
  const AnimeCard({Key? key, required this.animeID}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeProvider = ref.watch(loadAnimeProvider(
      animeID: animeID,
      hasDbData: false,
    ));

    return animeProvider.when(
      data: (anime) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AnimeScreen(animeID: anime.id!),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Stack(children: [
                  Image.network(
                    anime.image!,
                    fit: BoxFit.fill,
                    height: 270,
                  ),
                  SizedBox(
                    height: 270,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(anime.score!.toString(),
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(anime.members.toString(),
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.people,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: const [
                    Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      "Lorem ipsum siamet dolorum epsilon atra esterni onho teldhuim",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    Text(
                      maxLines: 1,
                      "Lorem ipsum siamet dolorum epsilon atra esterni onho teldhuim",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "An error has occured. Please try again later. ($error)",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, color: Colors.red),
            ),
          ),
        );
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
