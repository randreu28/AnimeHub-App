import 'dart:convert';

import 'package:http/http.dart' as http;

enum AnimeStatus {
  completed,
  watching,
  notWatched,
}

class Anime {
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

  return Anime(
    title: data["titles"][0]["title"],
    image: data["images"]["jpg"]["image_url"],
    score: data["score"],
    rank: data["rank"],
    popularity: data["popularity"],
    members: data["members"],
    favorites: data["favorites"],
    airingStatus: data["status"],
    synopsis: data["synopsis"],
    genres: /* TODO */ List.filled(5, "test"),
    episodes: data["episodes"],
    isFavorite: true /* TODO */,
    status: AnimeStatus.completed,
  );
}
