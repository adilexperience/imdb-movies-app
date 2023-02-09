import 'package:dio/dio.dart';
import 'package:imdb_movies_app/models/key_value_model.dart';
import 'package:imdb_movies_app/models/movie_model.dart';

import '../utils/constants.dart';

class ApiService {
  static Future<List<KeyValueModel>> getAllGenre() async {
    List<KeyValueModel> genres = [];
    var response = await Dio().get(
        "${Constants.baseURL}genre/movie/list?api_key=${Constants.apiKEY}");

    for (var data in response.data['genres']) {
      genres.add(
        KeyValueModel(
          key: data['id'].toString(),
          value: data['name'],
        ),
      );
    }
    return genres;
  }

  static Future<List<MovieModel>> getUpcomingMovies() async {
    List<MovieModel> movies = [];
    var response = await Dio()
        .get("${Constants.baseURL}movie/upcoming?api_key=${Constants.apiKEY}");

    for (var data in response.data['results']) {
      movies.add(
        MovieModel(
          backdropPath: data['backdrop_path'],
          genreIds: List<int>.from(data['genre_ids']),
          id: data['id'],
          originalTitle: data['original_title'],
          overview: data['overview'],
          posterPath: data['poster_path'],
          releaseDate: data['release_date'],
          title: data['title'],
        ),
      );
    }
    return movies;
  }

  static Future<List<MovieModel>> getTopMovies() async {
    List<MovieModel> movies = [];
    var response = await Dio()
        .get("${Constants.baseURL}movie/top_rated?api_key=${Constants.apiKEY}");

    for (var data in response.data['results']) {
      movies.add(
        MovieModel(
          backdropPath: data['backdrop_path'],
          genreIds: List<int>.from(data['genre_ids']),
          id: data['id'],
          originalTitle: data['original_title'],
          overview: data['overview'],
          posterPath: data['poster_path'],
          releaseDate: data['release_date'],
          title: data['title'],
        ),
      );
    }
    return movies;
  }

  static Future<List<MovieModel>> searchMovies(String query) async {
    List<MovieModel> movies = [];
    var response = await Dio().get(
        "${Constants.baseURL}search/movie?api_key=${Constants.apiKEY}&query=$query");

    for (var data in response.data['results']) {
      print(data);
      movies.add(
        MovieModel(
          backdropPath: data['backdrop_path'] ?? "",
          genreIds: List<int>.from(data['genre_ids']),
          id: data['id'],
          originalTitle: data['original_title'],
          overview: data['overview'],
          posterPath: data['poster_path'] ?? "",
          releaseDate: data['release_date'],
          title: data['title'],
        ),
      );
    }
    return movies;
  }
}
