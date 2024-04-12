import 'package:flutter/material.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/favorite_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/now_playing_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/top_rated_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/upcoming_page.dart';
import 'package:flutter_movie_box/settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            leading: const Icon(Icons.movie),
            title: const Text('Upcoming Movies'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(UpcomingPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Top Rated Movies'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(TopRatedPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.play_arrow),
            title: const Text('Now Playing Movies'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(NowPlayingPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite Movies'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(FavoriteMoviesPage.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
