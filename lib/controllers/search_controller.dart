import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/api_service/api_service.dart';
import 'package:imdb_movies_app/controllers/utils/constants.dart';
import 'package:imdb_movies_app/models/movie_model.dart';

class SearchController extends ChangeNotifier {
  List<MovieModel> searchedMovies = [];
  TextEditingController searchController = TextEditingController();

  // initial state
  IMDB searchScreenState = IMDB.nonSearchingState;

  void changeState(IMDB newState) {
    searchScreenState = newState;
    notifyListeners();
  }

  void clearSearch() {
    searchController.text = "";
    searchedMovies.clear();
    notifyListeners();
  }

  void searchMovie(String query) async {
    searchedMovies = await ApiService.searchMovies(query);
    notifyListeners();
  }
}
