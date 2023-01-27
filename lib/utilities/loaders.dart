import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p1_coronado/models/anime.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p1_coronado/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'loaders.g.dart';

@riverpod
Future<Anime> parseJsonToAnime(ref,
    {required dynamic json,
    required int animeID,
    required bool hasDbData}) async {
  bool isFavorite = false;
  AnimeStatus status = AnimeStatus.notWatched;
  if (hasDbData) {
    final db = FirebaseFirestore.instance;

    final docRef = await db
        .collection("animes")
        .doc(animeID.toString())
        .get()
        .onError((error, stackTrace) => throw Exception(error));

    if (docRef.exists) {
      final data = docRef.data() as Map<String, dynamic>;
      isFavorite = data["isFavorite"] as bool;
      status = AnimeStatus.values //Converts string to enum
          .firstWhere(
        (e) => e.toString() == data["status"],
        orElse: () => AnimeStatus.notWatched,
      );
    }
  }

  return Anime(
    id: animeID,
    title: json["titles"][0]["title"],
    image: json["images"]["jpg"]["image_url"],
    score: json["score"],
    rank: json["rank"],
    popularity: json["popularity"],
    members: json["members"],
    favorites: json["favorites"],
    airingStatus: json["status"],
    synopsis: json["synopsis"],
    genres: List.generate(
        json["genres"].length, (genre) => json["genres"][genre]["name"]),
    episodes: json["episodes"],
    isFavorite: isFavorite,
    status: status,
  );
}

@riverpod
Future<Anime> loadAnime(ref,
    {required int animeID, required bool hasDbData}) async {
  final url = Uri.parse("https://api.jikan.moe/v4/anime/$animeID");
  final response = await http.get(url);
  final json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }
  final data = json["data"];

  return parseJsonToAnime(animeID,
      json: data, animeID: animeID, hasDbData: hasDbData);
}

@riverpod
Future<List<Anime>> loadTopAnimes(ref) async {
  final url = Uri.parse("https://api.jikan.moe/v4/top/anime");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  List<Anime> topAnimes = [];

  for (final animeData in data) {
    topAnimes.add(await parseJsonToAnime("topAnimes",
        json: animeData, animeID: animeData["mal_id"], hasDbData: false));
  }
  return topAnimes;
}

@riverpod
Future<Anime> loadRandomAnime(ref) async {
  final url = Uri.parse("https://api.jikan.moe/v4/random/anime");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  return parseJsonToAnime(data["mal_id"],
      json: data, animeID: data["mal_id"], hasDbData: false);
}

@riverpod
Future<List<Anime>> loadUpcomingSeasons(ref) async {
  final url = Uri.parse("https://api.jikan.moe/v4/seasons/upcoming");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  List<Anime> upcomingSeasons = [];

  for (final animeData in data) {
    upcomingSeasons.add(await parseJsonToAnime("upcomingSeason",
        json: animeData, animeID: animeData["mal_id"], hasDbData: false));
  }
  return upcomingSeasons;
}

@riverpod
Future<List<Anime?>> loadAnimeSearch(ref,
    {required String query, required List<int>? genresID}) async {
  var parsedGenres = "";
  if (genresID != null) {
    parsedGenres = genresID.join(",");
  }
  final url =
      Uri.parse("https://api.jikan.moe/v4/anime?q=$query&genres=$parsedGenres");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  if (json["data"] == null) {
    return List.filled(1, null);
    // An empty list = no results. But it is still a valid search.
  }

  List<Anime> animeSearch = [];

  for (final animeData in data) {
    animeSearch.add(await parseJsonToAnime(query,
        animeID: animeData["mal_id"], json: animeData, hasDbData: false));
  }
  return animeSearch;
}

@riverpod
Future<int> loadRandomCompletedAnime(ref) async {
  final db = FirebaseFirestore.instance;

  final watchingAnimes = await db
      .collection("animes")
      .where("status", isEqualTo: AnimeStatus.completed.toString())
      .get()
      .onError((error, stackTrace) => throw Exception(error));

  final length = watchingAnimes.size;

  if (length == 0) {
    return 0;
    //If there isn't any anime being watched, return 0 to inform front-end
  }
  final randomDoc = Random().nextInt(watchingAnimes.size);

  return int.parse(watchingAnimes.docs[randomDoc].id);
}

@riverpod
Future<User> loadUser(ref, {required String username}) async {
  final url = Uri.parse("https://api.jikan.moe/v4/users/$username");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  return User(
      id: data["mal_id"],
      username: data["username"],
      image: data["images"]["jpg"]["image_url"],
      lastOnline: DateTime.parse(data["last_online"]),
      gender: data["gender"],
      birthday:
          data["birthday"] != null ? DateTime.parse(data["birthday"]) : null,
      location: data["location"],
      joined: DateTime.parse(data["joined"]));
}

@riverpod
Future<List<Anime>> loadRecommendations(ref, {required int animeID}) async {
  final url =
      Uri.parse("https://api.jikan.moe/v4/anime/$animeID/recommendations");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  List<Anime> recommendations = [];

  for (final recData in data) {
    recommendations.add(Anime(
      id: recData["entry"]["mal_id"],
      image: recData["entry"]["images"]["jpg"]["image_url"],
      title: recData["entry"]["title"],
      airingStatus: null,
      episodes: null,
      favorites: null,
      genres: null,
      members: null,
      popularity: null,
      rank: null,
      score: null,
      synopsis: null,
      isFavorite: false,
      status: AnimeStatus.notWatched,
    ));
  }

  return recommendations;
}

@riverpod
Future<List<int>> loadStatusIDs(ref, {required AnimeStatus status}) async {
  final db = FirebaseFirestore.instance;

  final watchingAnimes = await db
      .collection("animes")
      .where("status", isEqualTo: status.toString())
      .get()
      .onError((error, stackTrace) => throw Exception(error));

  return watchingAnimes.docs.map((doc) => int.parse(doc.id)).toList();
}

@riverpod
Future<List<int>> loadFavoriteIDs(ref) async {
  final db = FirebaseFirestore.instance;

  final watchingAnimes = await db
      .collection("animes")
      .where(
        "isFavorite",
        isEqualTo: true,
      )
      .get()
      .onError((error, stackTrace) => throw Exception(error));

  return watchingAnimes.docs.map((doc) => int.parse(doc.id)).toList();
}

@riverpod
Future<Map<String, int>> loadGenres(ref) async {
  final url = Uri.parse("https://api.jikan.moe/v4/genres/anime");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }

  return {
    for (final genre in data) genre["name"] as String: genre["mal_id"],
  };
}
