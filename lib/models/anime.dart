import 'package:cloud_firestore/cloud_firestore.dart';

enum AnimeStatus {
  completed,
  watching,
  notWatched,
}

class Anime {
  int? id;
  String? image;
  String? title;
  double? score;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? airingStatus;
  String? synopsis;
  List<String>? genres;
  int? episodes;
  bool isFavorite;
  AnimeStatus status;

  void setStatus(AnimeStatus newAnimeStatus) {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("animes").doc(id.toString());

    docRef.set(<String, dynamic>{
      "isFavorite": isFavorite,
      "status": newAnimeStatus.toString(),
    }).catchError((error) => {print(error.toString())});

    status = newAnimeStatus;
  }

  void setIsFavorite(bool newIsFavorite) {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("animes").doc(id.toString());

    docRef.set(<String, dynamic>{
      "isFavorite": newIsFavorite,
      "status": status,
    }).catchError((error) => {print(error.toString())});

    isFavorite = newIsFavorite;
  }

  Anime({
    required this.id,
    required this.title,
    required this.image,
    required this.score,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.airingStatus,
    required this.synopsis,
    required this.genres,
    required this.episodes,
    required this.isFavorite,
    required this.status,
  });
}
