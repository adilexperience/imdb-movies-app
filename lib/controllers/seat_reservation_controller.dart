import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/utils/constants.dart';
import 'package:imdb_movies_app/models/key_value_model.dart';

class SeatReservationController extends ChangeNotifier {
  // initial state
  IMDB reservationState = IMDB.dateTimeReservationState;

  // selected date, default first date
  KeyValueModel selectedDate = Constants.dates.first;
  int selectedTime = 0;

  void changeState(IMDB newState) {
    reservationState = newState;
    notifyListeners();
  }

  void selectDate(KeyValueModel newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  selectTime(int newTime) {
    selectedTime = newTime;
    notifyListeners();
  }
}
