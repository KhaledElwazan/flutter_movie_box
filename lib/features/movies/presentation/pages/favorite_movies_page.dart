import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/widgets/movie_card.dart';

class FavoriteMoviesPage extends StatefulWidget {
  static const String routeName = '/favorite-movies';
  const FavoriteMoviesPage({super.key});

  @override
  State<FavoriteMoviesPage> createState() => _FavoriteMoviesPageState();
}

class _FavoriteMoviesPageState extends State<FavoriteMoviesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoritesBloc>(context).add(GetAllFavoriteMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<FavoritesBloc>(context)
                  .add(ClearFavoritesEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, state) {
          if (state is FavoritesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoritesLoaded && state.movies.isNotEmpty) {
            List<Movie> favorites = state.movies;
            return ListView(
              children: favorites.map((movie) {
                BriefMovie briefMovie = BriefMovie(
                  genreIds: movie.genres.map((genre) => genre.id).toList(),
                  id: movie.id,
                  title: movie.title,
                  voteAverage: movie.voteAverage,
                  adult: movie.adult,
                  backdropPath: movie.backdropPath,
                  posterPath: movie.posterPath,
                  originalLanguage: movie.originalLanguage,
                  originalTitle: movie.originalTitle,
                  overview: movie.overview,
                  popularity: movie.popularity,
                  releaseDate: movie.releaseDate.toString(),
                  video: movie.video,
                  voteCount: movie.voteCount,
                );

                return MovieCard(movie: briefMovie);
              }).toList(),
            );
          }

          return const Center(
            child: Text('No favorite movies'),
          );
        },
      ),
    );
  }
}
