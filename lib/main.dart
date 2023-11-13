import 'package:flutter/material.dart';
import 'package:movies/core/theme/application_theme.dart';
import 'package:movies/layout/home_layout.dart';
import 'package:movies/pages/browse/widgets/genre_view.dart';
import 'package:movies/pages/home/home_detials/home_details_view.dart';
import 'package:movies/pages/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ApplicationTheme.theme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        GenreView.routeName: (context) => const GenreView(),
        HomeDetailsView.routeName: (context) =>  HomeDetailsView(),
      },
    );
  }
}