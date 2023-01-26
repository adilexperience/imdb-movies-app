import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/api_service/api_service.dart';
import 'package:imdb_movies_app/controllers/search_controller.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:imdb_movies_app/controllers/utils/constants.dart';
import 'package:imdb_movies_app/models/movie_model.dart';
import 'package:imdb_movies_app/views/movie_detail_screen.dart';
import 'package:imdb_movies_app/views/search_results_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchController>(
        builder: (context, controller, child) => controller.searchScreenState ==
                IMDB.nonSearchingState
            ? Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.fromLTRB(
                      30.0,
                      60.0,
                      30.0,
                      20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Top Movies",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              controller.changeState(IMDB.searchingState),
                          child: const Icon(
                            Icons.search,
                            color: AppColors.black,
                            size: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: FutureBuilder<List<MovieModel>>(
                      future: ApiService.getTopMovies(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            MovieModel movie = snapshot.data![index];
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(movie: movie),
                                ),
                              ),
                              child: Container(
                                height: 220.0,
                                margin: const EdgeInsets.only(bottom: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                          Constants.imageBaseURL +
                                              Constants.imageSize +
                                              movie.backdropPath,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20.0,
                                      left: 20.0,
                                      child: Text(
                                        movie.title,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            : const SearchResultsScreen(),
      ),
    );
  }
}
