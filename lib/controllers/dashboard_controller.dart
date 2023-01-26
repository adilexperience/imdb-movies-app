import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:imdb_movies_app/views/categories_screen.dart';
import 'package:imdb_movies_app/views/search_screen.dart';
import 'package:imdb_movies_app/views/watch_screen.dart';

class DashboardController extends ChangeNotifier {
  int activeIndex = 1;

  List<Widget> screens = [
    const SearchScreen(),
    const WatchScreen(),
    const Scaffold(
      body: Center(
        child: Text("Media Library"),
      ),
    ),
    const CategoriesScreen(),
  ];

  Color getColor({required int currentIndex, required int itemIndex}) {
    if (itemIndex == currentIndex) {
      return AppColors.white;
    } else {
      return AppColors.unSelectedIcon;
    }
  }

  void changeScreen({required int newIndex}) {
    activeIndex = newIndex;
    notifyListeners();
  }
}
