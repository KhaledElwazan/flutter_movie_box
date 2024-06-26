import 'package:flutter/material.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/favorite_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/now_playing_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/top_rated_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/upcoming_page.dart';
import 'package:flutter_movie_box/settings_page.dart';
import 'package:logging/logging.dart';

class AppDrawer extends StatelessWidget {
  final bool enableNavigation;
  final Function(int)? onNavigate;

  const AppDrawer({
    super.key,
    this.enableNavigation = true,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final Logger logger = Logger('AppDrawer');
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.moving),
            title: const Text('Popular Movies'),
            onTap: () {
              if (!enableNavigation) {
                // call the onNavigate function with the index of the tapped item
                logger.info('Switch to Popular Movies');
                onNavigate?.call(0);
              } else {
                logger.info('Navigating to Popular Movies');
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(PopularMoviesPage.routeName);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Upcoming Movies'),
            onTap: () {
              if (!enableNavigation) {
                // call the onNavigate function with the index of the tapped item
                logger.info('Switch to Upcoming Movies');
                onNavigate?.call(1);
              } else {
                logger.info('Navigating to Upcoming Movies');
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(UpcomingPage.routeName);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Top Rated Movies'),
            onTap: () {
              if (!enableNavigation) {
                // call the onNavigate function with the index of the tapped item
                logger.info('Switch to Top Rated Movies');
                onNavigate?.call(2);
              } else {
                logger.info('Navigating to Top Rated Movies');
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(TopRatedPage.routeName);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.play_arrow),
            title: const Text('Now Playing Movies'),
            onTap: () {
              if (!enableNavigation) {
                // call the onNavigate function with the index of the tapped item
                logger.info('Switch to Now Playing Movies');
                onNavigate?.call(3);
              } else {
                logger.info('Navigating to Now Playing Movies');
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(NowPlayingPage.routeName);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite Movies'),
            onTap: () {
              if (!enableNavigation) {
                // call the onNavigate function with the index of the tapped item
                logger.info('Switch to Favorite Movies');
                onNavigate?.call(4);
              } else {
                logger.info('Navigating to Favorite Movies');
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FavoriteMoviesPage.routeName);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              if (enableNavigation) {
                Navigator.of(context).pop();
              }
              logger.info('Navigating to Settings');
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
