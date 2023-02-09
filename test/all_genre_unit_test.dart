import 'package:flutter_test/flutter_test.dart';

import 'mock_service/MockService.dart';

void main() {
  test('Fetch all genres', () async {
    final movieService = MockService();
    final movies = await movieService.getAllGenre();
    expect(movies.length, 5);
    expect(movies[0].value, 'Action');
    expect(movies[1].value, 'Adventure');
  });
}
