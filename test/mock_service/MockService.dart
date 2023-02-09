import 'package:imdb_movies_app/models/key_value_model.dart';

class MockService {
  List<KeyValueModel> allMockGenres = [
    KeyValueModel(key: '1', value: 'Action'),
    KeyValueModel(key: '2', value: 'Adventure'),
    KeyValueModel(key: '3', value: 'Animation'),
    KeyValueModel(key: '4', value: 'Comedy'),
    KeyValueModel(key: '5', value: 'Crime'),
  ];

  Future<List<KeyValueModel>> getAllGenre() async {
    // Replace this with a real API call in the future
    return Future.delayed(const Duration(seconds: 5), () => allMockGenres);
  }
}
