import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p1_coronado/models/anime.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p1_coronado/models/user.dart';

Future<List<Anime>> loadRecommendations(int animeID) async {
  final url =
      Uri.parse("https://api.jikan.moe/v4/anime/$animeID/recommendations");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

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

Future<Anime> loadRandomAnime() async {
  final url = Uri.parse("https://api.jikan.moe/v4/random/anime");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  return parseJsonToAnime(data, data["mal_id"]);
}

Future<List<Anime>> loadUpcomingSeasons() async {
  final url = Uri.parse("https://api.jikan.moe/v4/seasons/upcoming");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  List<Anime> upcomingSeasons = [];

  for (final animeData in data) {
    upcomingSeasons.add(await parseJsonToAnime(animeData, animeData["mal_id"]));
  }
  return upcomingSeasons;
}

Future<List<Anime?>> loadAnimeSearch(String q, [List<int>? genresID]) async {
  var parsedGenres = "";
  if (genresID != null) {
    parsedGenres = genresID.join(",");
  }
  final url =
      Uri.parse("https://api.jikan.moe/v4/anime?q=$q&genres=$parsedGenres");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  if (json["data"] == null) {
    return List.filled(1, null);
    // An empty list = no results. But it is still a valid search.
  }

  List<Anime> animeSearch = [];

  for (final animeData in data) {
    animeSearch.add(await parseJsonToAnime(animeData, animeData["mal_id"]));
  }
  return animeSearch;
}

Future<int> loadRandomWatchingAnime() async {
  final db = FirebaseFirestore.instance;

  final watchingAnimes = await db
      .collection("animes")
      .where("status", isEqualTo: "AnimeStatus.watching")
      .get();

  final length = watchingAnimes.size;
  final randomDoc = Random().nextInt(watchingAnimes.size);

  if (length == 0) {
    return 0;
    //If there isn't any anime being watched, return 0 to inform front-end
  }

  return int.parse(watchingAnimes.docs[randomDoc].id);
}

Future<User> loadUser(String username) async {
  final url = Uri.parse("https://api.jikan.moe/v4/users/$username");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  Gender? newGender;

  if (data["gender"] == null) {
    newGender = data["gender"];
  } else {
    newGender = Gender.values //Converts string to enum
        .firstWhere((e) => e.toString() == 'Gender.${data["gender"]}');
  }

  return User(
      id: data["mal_id"],
      username: data["username"],
      image: data["images"]["jpg"]["image_url"],
      lastOnline: DateTime.parse(data["last_online"]),
      gender: newGender,
      birthday:
          data["birthday"] != null ? DateTime.parse(data["birthday"]) : null,
      location: data["location"],
      joined: DateTime.parse(data["joined"]));
}
