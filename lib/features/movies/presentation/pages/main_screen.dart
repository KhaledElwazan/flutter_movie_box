import 'package:flutter/material.dart';
import 'package:flutter_movie_box/core/responsive/responsive.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/favorite_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/now_playing_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/top_rated_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/upcoming_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/widgets/app_drawer.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;

  List<Widget> views = [
    const PopularMoviesPage(),
    const UpcomingPage(),
    const TopRatedPage(),
    const NowPlayingPage(),
    const FavoriteMoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: views[activeIndex],
        desktop: Row(
          children: [
            Expanded(
              flex: size.width > 1340 ? 2 : 4,
              child: AppDrawer(
                enableNavigation: false,
                onNavigate: (value) {
                  setState(() {
                    if (activeIndex != value) {
                      activeIndex = value;
                    }
                  });
                },
              ),
            ),
            Expanded(
              flex: size.width > 1340 ? 8 : 10,
              child: views[activeIndex],
            ),
          ],
        ),
        tablet: Row(
          children: [
            Expanded(
              flex: 4,
              child: AppDrawer(
                enableNavigation: false,
                onNavigate: (value) {
                  setState(() {
                    if (activeIndex != value) {
                      activeIndex = value;
                    }
                  });
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: views[activeIndex],
            ),
          ],
        ),
      ),
    );
  }
}
