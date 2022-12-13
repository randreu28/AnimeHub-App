import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p1_coronado/anime_screen.dart';
import 'package:p1_coronado/firebase_options.dart';
import 'package:p1_coronado/model/anime.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: Anime(
        isCompleted: true,
        isFavorite: true,
        titulo: "Hunter x Hunter (2011)",
        subtitulo: "Hunter x Hunter",
        image:
            "https://pics.filmaffinity.com/Hunter_x_Hunter_Serie_de_TV-444297736-large.jpg",
        rating: "9.04",
        users: "(1,554,780 users)",
        ranking: "#10",
        canal: "TV (148eps)",
        aired: "Fall 2011",
        studio: "Madhouse",
        order: "Top > Anime > Hunter x Hunter (2011)",
        synopsis:
            "Hunters devote themselves to accomplishing hazardous tasks, all from traversing the world's uncharted territories to locating rare items and monsters. Before becoming a Hunter, one must pass the Hunter Examination—a high-risk selection process in which most applicants end up handicapped or worse, deceased.",
        synopsis2:
            "Ambitious participants who challenge the notorious exam carry their own reason. What drives 12-year-old Gon Freecss is finding Ging, his father and a Hunter himself. Believing that he will meet his father by becoming a Hunter, Gon takes the first step to walk the same path.",
      ),
      child: const MaterialApp(
        title: 'Tasca 1 Disseny de Pantalla',
        home: AnimeScreen(),
      ),
    );
  }
}
