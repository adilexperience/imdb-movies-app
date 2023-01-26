import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/seat_reservation_controller.dart';
import 'package:imdb_movies_app/controllers/utils/app_colors.dart';
import 'package:imdb_movies_app/models/key_value_model.dart';
import 'package:imdb_movies_app/views/seat_reservation_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/utils/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/cat_10.png",
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
                        const Text(
                          "In Theaters December 22, 2021",
                          style: TextStyle(
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
                    child: ListView.builder(
                      itemCount: Constants.genres.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        KeyValueModel keyValue = Constants.genres[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse("0xFF${keyValue.value}"),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: Center(child: Text(keyValue.key)),
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
                  const Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Text(
                      "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
                      style: TextStyle(
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
