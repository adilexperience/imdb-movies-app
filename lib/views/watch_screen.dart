import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/search_controller.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:imdb_movies_app/controllers/utils/constants.dart';
import 'package:imdb_movies_app/models/movie_model.dart';
import 'package:imdb_movies_app/views/search_results_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/api_service/api_service.dart';
import 'movie_detail_screen.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService.getAllGenre();
    print(ApiService.getUpcomingMovies());
    print(ApiService.getTopMovies());
    print(ApiService.searchMovies("father"));
    return Scaffold(
      body: Consumer<SearchController>(
        builder: (context, controller, child) => controller.searchScreenState ==
                IMDB.nonSearchingState
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          "Watch",
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20.0,
                        40.0,
                        20.0,
                        0.0,
                      ),
                      child: FutureBuilder<List<MovieModel>>(
                          future: ApiService.getUpcomingMovies(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CupertinoActivityIndicator(),
                              );
                            }
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 3.5),
                              ),
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                MovieModel movie = snapshot.data![index];
                                return InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movie: movie),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              Constants.imageBaseURL +
                                                  Constants.imageSize +
                                                  movie.backdropPath,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10.0,
                                          left: 10.0,
                                          child: Text(
                                            movie.title,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ),
                ],
              )
            : SearchResultsScreen(),
      ),
    );
  }
}
