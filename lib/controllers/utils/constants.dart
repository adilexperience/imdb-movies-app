import 'package:imdb_movies_app/models/key_value_model.dart';

// enumerations for switching frontend view
enum IMDB {
  searchingState,
  nonSearchingState,
  dateTimeReservationState,
  seatReservationState,
}

class Constants {
  static List<KeyValueModel> dates = [
    KeyValueModel(key: "27_jan", value: "27 Jan"),
    KeyValueModel(key: "28_jan", value: "28 Jan"),
    KeyValueModel(key: "29_jan", value: "29 Jan"),
    KeyValueModel(key: "30_jan", value: "30 Jan"),
    KeyValueModel(key: "31_jan", value: "31 Jan"),
    KeyValueModel(key: "1_feb", value: "1 Jan"),
  ];

  static List<KeyValueModel> genres = [
    KeyValueModel(
      key: "Comedies",
      value: "15D2BC",
    ),
    KeyValueModel(
      key: "Crime",
      value: "E26CA5",
    ),
    KeyValueModel(
      key: "Family",
      value: "564CA3",
    ),
    KeyValueModel(
      key: "Documentaries",
      value: "CD9D0F",
    ),
  ];

  static List<KeyValueModel> categories = [
    KeyValueModel(
      key: "Comedies",
      value: "assets/images/cat_10.png",
    ),
    KeyValueModel(
      key: "Crime",
      value: "assets/images/cat_9.png",
    ),
    KeyValueModel(
      key: "Family",
      value: "assets/images/cat_8.png",
    ),
    KeyValueModel(
      key: "Documentaries",
      value: "assets/images/cat_7.png",
    ),
    KeyValueModel(
      key: "Dramas",
      value: "assets/images/cat_6.png",
    ),
    KeyValueModel(
      key: "Fantasy",
      value: "assets/images/cat_5.png",
    ),
    KeyValueModel(
      key: "Holidays",
      value: "assets/images/cat_4.png",
    ),
    KeyValueModel(
      key: "Horror",
      value: "assets/images/cat_3.png",
    ),
    KeyValueModel(
      key: "Sci-Fi",
      value: "assets/images/cat_2.png",
    ),
    KeyValueModel(
      key: "Thriller",
      value: "assets/images/cat_1.png",
    ),
  ];
}
