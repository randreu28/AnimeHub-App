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

Future<bool> loadIsFavorite(int animeID) async {
  final db = FirebaseFirestore.instance;

  final docRef = await db.collection("animes").doc(animeID.toString()).get();

  if (docRef.exists) {
    final data = docRef.data() as Map<String, dynamic>;
    return data["isFavorite"];
  }
  return false;
}

Future<AnimeStatus> loadStatus(int animeID) async {
  final db = FirebaseFirestore.instance;

  final docRef = await db.collection("animes").doc(animeID.toString()).get();

  if (docRef.exists) {
    final data = docRef.data() as Map<String, dynamic>;

    AnimeStatus status = AnimeStatus.values //Converts string to enum
        .firstWhere((e) => e.toString() == data["status"]);

    return status;
  }
  return AnimeStatus.notWatched;
}

Future<Anime> parseJsonToAnime(dynamic data, int animeID) async {
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
    isFavorite: await loadIsFavorite(animeID),
    status: await loadStatus(animeID),
  );
}

Future<Anime> loadAnime(int animeID) async {
  final url = Uri.parse("https://api.jikan.moe/v4/anime/$animeID");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  return parseJsonToAnime(data, animeID);
}

Future<List<Anime>> loadTopAnimes() async {
  final url = Uri.parse("https://api.jikan.moe/v4/top/anime");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  List<Anime> topAnimes = [];

  for (final animeData in data) {
    topAnimes.add(await parseJsonToAnime(animeData, animeData["mal_id"]));
  }
  return topAnimes;
}
