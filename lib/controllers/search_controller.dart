import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/utils/constants.dart';

class SearchController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  // initial state
  IMDB searchScreenState = IMDB.nonSearchingState;

  void changeState(IMDB newState) {
    searchScreenState = newState;
    notifyListeners();
  }

  void clearSearch() {
    searchController.text = "";
    notifyListeners();
  }
}
