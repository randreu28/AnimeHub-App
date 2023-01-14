import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: constant_identifier_names
enum Gender { Any, Male, Female, Ninbinary }

class User {
  int id;
  String username;
  String? image;
  DateTime lastOnline;
  Gender? gender;
  DateTime? birthday;
  String? location;
  DateTime joined;

  User({
    required this.id,
    required this.username,
    required this.image,
    required this.lastOnline,
    required this.gender,
    required this.birthday,
    required this.location,
    required this.joined,
  });
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
