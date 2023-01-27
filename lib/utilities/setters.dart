import 'package:p1_coronado/models/anime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

setIsFavorite({required int animeId, required bool isFavorite}) async {
  final db = FirebaseFirestore.instance;
  final doc = db.collection("animes").doc(animeId.toString());

  final prevDoc = await doc.get();

  doc.set({
    "isFavorite": isFavorite,
    "status":
        prevDoc.exists ? prevDoc["status"] : AnimeStatus.notWatched.toString(),
  }).onError(
    (error, stackTrace) => throw Exception(error),
  );
}

setStatus({required int animeId, required AnimeStatus status}) async {
  final db = FirebaseFirestore.instance;
  final doc = db.collection("animes").doc(animeId.toString());

  final prevDoc = await doc.get();

  doc.set({
    "isFavorite": prevDoc.exists ? prevDoc["isFavorite"] : false,
    "status": status.toString(),
  }).onError(
    (error, stackTrace) => throw Exception(error),
  );
}
