import 'package:flutter/material.dart';
import 'package:imdb_movies_app/controllers/dashboard_controller.dart';
import 'package:imdb_movies_app/controllers/search_controller.dart';
import 'package:provider/provider.dart';

import 'controllers/seat_reservation_controller.dart';
import 'views/dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SeatReservationController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDB Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}
