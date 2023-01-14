import 'dart:convert';
import 'package:http/http.dart' as http;

class Recommendations {
  int id;
  String image;
  String title;
  int votes;

  Recommendations({
    required this.id,
    required this.image,
    required this.title,
    required this.votes,
  });
}

Future<List<Recommendations>> loadRecommendations(int animeID) async {
  final url =
      Uri.parse("https://api.jikan.moe/v4/anime/$animeID/recommendations");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final data = json["data"];

  List<Recommendations> recommendations = [];

  for (final recData in data) {
    recommendations.add(
      Recommendations(
          id: recData["entry"]["mal_id"],
          image: recData["entry"]["images"]["jpg"]["image_url"],
          title: recData["entry"]["title"],
          votes: recData["votes"]),
    );
  }

  return recommendations;
}
