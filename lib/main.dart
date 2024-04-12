import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/add_remove_favorites/add_remove_favorite_movies_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/favorite_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/now_playing_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/top_rated_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/upcoming_page.dart';
import 'package:flutter_movie_box/injection_container.dart';
import 'package:flutter_movie_box/settings_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsBloc>(
          create: (context) => MovieDetailsBloc(
            getMovieDetails: sl(),
          ),
        ),
        BlocProvider<FavoritesBloc>(
          create: (context) => FavoritesBloc(
            getAllFavoriteMovies: sl(),
            isFavoriteMovie: sl(),
            clearFavorites: sl(),
          )..add(GetAllFavoriteMoviesEvent()),
        ),
        BlocProvider<AddRemoveFavoriteMoviesBloc>(
            create: (context) => AddRemoveFavoriteMoviesBloc(
                  addMovie2Favorites: sl(),
                  removeMovieFromFavorites: sl(),
                )),
      ],
      child: AdaptiveTheme(
        light: FlexThemeData.light(scheme: FlexScheme.mandyRed),
        dark: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        initial: AdaptiveThemeMode.light,
        debugShowFloatingThemeButton: true,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Movie Box',
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: PopularMoviesPage.routeName,
          routes: {
            PopularMoviesPage.routeName: (context) => const PopularMoviesPage(),
            UpcomingPage.routeName: (context) => const UpcomingPage(),
            TopRatedPage.routeName: (context) => const TopRatedPage(),
            NowPlayingPage.routeName: (context) => const NowPlayingPage(),
            FavoriteMoviesPage.routeName: (context) =>
                const FavoriteMoviesPage(),
            SettingsPage.routeName: (context) => const SettingsPage(),
          },
        ),
      ),
    );
  }
}
