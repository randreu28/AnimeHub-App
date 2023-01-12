import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

enum AnimeStatus {
  completed,
  watching,
  notWatched,
}

class Anime {
  int id;
  String image;
  String title;
  double score;
  int rank;
  int popularity;
  int members;
  int favorites;
  String airingStatus;
  String synopsis;
  List<String> genres;
  int episodes;
  bool isFavorite;
  AnimeStatus status;

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

Future<Anime> loadAnime(int animeID) async {
  final url = Uri.parse("https://api.jikan.moe/v4/anime/$animeID");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  final db = FirebaseFirestore.instance;

  Future<bool> loadIsFavorite() async {
    final docRef = db.collection("animes").doc(animeID.toString());

    return await docRef.get().then((DocumentSnapshot doc) {
      if (doc.exists == false) return false;
      final data = doc.data() as Map<String, dynamic>;
      return data["isFavorite"];
    });
  }

  Future<AnimeStatus> loadStatus() async {
    final docRef = db.collection("animes").doc(animeID.toString());

    return await docRef.get().then((DocumentSnapshot doc) {
      if (doc.exists == false) return AnimeStatus.notWatched;

      final data = doc.data() as Map<String, dynamic>;
      switch (data["status"]) {
        case "completed":
          return AnimeStatus.completed;
        case "watching":
          return AnimeStatus.watching;
        case "notWatched":
          return AnimeStatus.notWatched;
        default:
          return AnimeStatus.notWatched;
      }
    });
  }

  return Anime(
    id: animeID,
    title: data["titles"][0]["title"],
    image: data["images"]["jpg"]["image_url"],
    score: data["score"],
    rank: data["rank"],
    popularity: data["popularity"],
    members: data["members"],
    favorites: data["favorites"],
    airingStatus: data["status"],
    synopsis: data["synopsis"],
    genres: List.generate(
        data["genres"].length, (genre) => data["genres"][genre]["name"]),
    episodes: data["episodes"],
    isFavorite: await loadIsFavorite(),
    status: await loadStatus(),
  );
}
