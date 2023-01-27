class User {
  int id;
  String username;
  String? image;
  DateTime? lastOnline;
  String? gender;
  DateTime? birthday;
  String? location;
  DateTime? joined;

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
