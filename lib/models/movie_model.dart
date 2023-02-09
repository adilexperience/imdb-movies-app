// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  MovieModel({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });

  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
      };
}
