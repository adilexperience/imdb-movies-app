import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/api_service/api_service.dart';
import 'package:imdb_movies_app/controllers/seat_reservation_controller.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:imdb_movies_app/models/key_value_model.dart';
import 'package:imdb_movies_app/models/movie_model.dart';
import 'package:imdb_movies_app/views/seat_reservation_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/utils/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    Constants.imageBaseURL +
                        Constants.imageSize +
                        movie.backdropPath,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 60,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        "Watch",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "In Theaters ${movie.releaseDate}",
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            Provider.of<SeatReservationController>(context,
                                    listen: false)
                                .changeState(IMDB.dateTimeReservationState);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SeatReservationScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80.0,
                              vertical: 18.0,
                            ),
                            child: const Text(
                              "Get tickets",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: AppColors.buttonColor,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60.0,
                            vertical: 15.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.play_arrow,
                                color: AppColors.white,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Watch Trailer",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 0.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Genres",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 30.0,
                    child: FutureBuilder<List<KeyValueModel>>(
                      future: ApiService.getAllGenre(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        List<KeyValueModel> values = snapshot.data!
                            .where((element) =>
                                movie.genreIds.toString().contains(element.key))
                            .map((e) => e)
                            .toList();
                        return ListView.builder(
                          itemCount: values.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            KeyValueModel keyValue = values[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(
                                  int.parse(
                                          (Random().nextDouble() * 0xFFFFFF)
                                              .toInt()
                                              .toRadixString(16)
                                              .substring(1, 6),
                                          radix: 16) +
                                      0xFF000000,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              margin: const EdgeInsets.only(right: 10.0),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: Center(
                                  child: Text(
                                keyValue.value,
                              )),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    "Overview",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Text(
                      movie.overview,
                      style: const TextStyle(
                        color: AppColors.unSelectedIcon,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
