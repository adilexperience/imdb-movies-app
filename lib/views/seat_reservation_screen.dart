import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/seat_reservation_controller.dart';
import 'package:provider/provider.dart';

import '../controllers/utils/app_colors.dart';
import '../controllers/utils/constants.dart';
import '../models/key_value_model.dart';

class SeatReservationScreen extends StatelessWidget {
  const SeatReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Consumer<SeatReservationController>(
        builder: (context, controller, child) => Column(
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
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        "Top Movies",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "Top Movies with date and time",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: controller.reservationState ==
                      IMDB.dateTimeReservationState
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                        40.0,
                        80.0,
                        0.0,
                        20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            height: 35.0,
                            child: ListView.builder(
                              itemCount: Constants.dates.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                KeyValueModel keyValue = Constants.dates[index];
                                return InkWell(
                                  onTap: () => controller.selectDate(keyValue),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: controller.selectedDate.key ==
                                              keyValue.key
                                          ? AppColors.buttonColor
                                          : AppColors.unSelectedIcon
                                              .withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    margin: const EdgeInsets.only(right: 10.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                    ),
                                    child: Center(
                                        child: Text(
                                      keyValue.value,
                                      style: TextStyle(
                                        color: controller.selectedDate.key ==
                                                keyValue.key
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          SizedBox(
                            height: 220.0,
                            child: ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: 285.0,
                                  child: InkWell(
                                    onTap: () => controller.selectTime(index),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: const [
                                            Text("12:30"),
                                            SizedBox(width: 10.0),
                                            Text("Cinetech + hall 1"),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            border: Border.all(
                                              color: controller.selectedTime ==
                                                      index
                                                  ? AppColors.buttonColor
                                                  : AppColors.unSelectedIcon
                                                      .withOpacity(0.25),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 45.0,
                                            vertical: 20.0,
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/seats/hall_seats.png",
                                                width: 155.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          children: const [
                                            Text("From "),
                                            Text(
                                              "\$50 ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text("or "),
                                            Text(
                                              "2500 bonus ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => controller
                                .changeState(IMDB.seatReservationState),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 18.0,
                              ),
                              margin: const EdgeInsets.only(
                                right: 40.0,
                                bottom: 20.0,
                              ),
                              child: const Center(
                                child: Text(
                                  "Select Seats",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 80.0),
                        Image.asset(
                          "assets/images/seats/hall_seats.png",
                          height: 300.0,
                        ),
                        const SizedBox(height: 20.0),
                        Expanded(
                          child: Container(
                            decoration:
                                const BoxDecoration(color: AppColors.white),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 30.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/seats/selected_seat.png",
                                          width: 20.0,
                                        ),
                                        const SizedBox(width: 15.0),
                                        const Text(
                                          "Selected",
                                          style: TextStyle(
                                            color: AppColors.unSelectedIcon,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/seats/not_available_seat.png",
                                          width: 20.0,
                                        ),
                                        const SizedBox(width: 15.0),
                                        const Text(
                                          "Not Available",
                                          style: TextStyle(
                                            color: AppColors.unSelectedIcon,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/seats/vip_seat.png",
                                          width: 20.0,
                                        ),
                                        const SizedBox(width: 15.0),
                                        const Text(
                                          "VIP (\$150)",
                                          style: TextStyle(
                                            color: AppColors.unSelectedIcon,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/seats/regular_seat.png",
                                          width: 20.0,
                                        ),
                                        const SizedBox(width: 15.0),
                                        const Text(
                                          "Regular (\$50)",
                                          style: TextStyle(
                                            color: AppColors.unSelectedIcon,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.unSelectedIcon
                                              .withOpacity(0.10),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 15.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: const [
                                            Text(
                                              "Total price",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              "\$ 50",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20.0,
                                          horizontal: 15.0,
                                        ),
                                        child: const Text(
                                          "Proceed to pay",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
