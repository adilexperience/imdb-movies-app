import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_movies_app/models/movie_model.dart';

void main() {
  test('Movie model class', () {
    final movie = MovieModel(
      backdropPath: "/a4I481szRmycyreQTLrRe4f4YJe.jpg",
      genreIds: [80, 53, 18],
      id: 1,
      originalTitle: "Transfusion",
      overview:
          "Ryan Logan, a former Special Forces operative, is battling to cope with life after the loss of his wife.  He is thrusted into the criminal underworld to keep his only son from being taken from him.",
      posterPath: "/bxh5xCCW9Ynfg6EZJWUkc1zqTnr.jpg",
      releaseDate: "2023-01-05",
      title: "Transfusion",
    );
    expect(movie.title, 'Transfusion');
    expect(movie.genreIds, [80, 53, 18]);
    expect(
      movie.backdropPath,
      "/a4I481szRmycyreQTLrRe4f4YJe.jpg",
    ); // to be added with Constants.imageBaseURL for complete URL
  });
}
