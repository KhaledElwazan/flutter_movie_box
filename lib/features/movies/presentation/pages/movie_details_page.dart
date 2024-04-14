import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/core/envs/env.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/add_remove_favorites/add_remove_favorite_movies_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatelessWidget {
  final BriefMovie movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is LoadingMovieDetails) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorLoadingMovieDetails) {
            return Text(state.message);
          }

          state = state as LoadedMovieDetails;
          Movie movieDetails = state.movieDetails;

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [Colors.transparent, Colors.black],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${Env.imageBaseUrl}/${movie.posterPath}',
                              fit: BoxFit.contain,
                              placeholder: (context, url) => const SizedBox(
                                width: 500,
                                height: 500,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10,
                        // left: 15,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white.withAlpha(40),
                                child: BackButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              const Spacer(),
                              CircleAvatar(
                                backgroundColor: Colors.white.withAlpha(40),
                                child: IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  color: Colors.white,
                                  onPressed: () {
                                    BlocProvider.of<
                                                AddRemoveFavoriteMoviesBloc>(
                                            context)
                                        .add(
                                      AddFavoriteMovieEvent(
                                          movie: movieDetails),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Added to favorites'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  movieDetailsWidget(
                      context: context, movieDetails: movieDetails),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget movieDetailsWidget(
      {required BuildContext context, required Movie movieDetails}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieDetails.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(width: 5),
          IntrinsicHeight(
            child: Row(
              children: [
                Text(
                  '${movieDetails.runtime} min',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
                const SizedBox(width: 5),
                Text(
                  DateFormat.yMMMd().format(movieDetails.releaseDate),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
                const SizedBox(width: 5),
                Text(
                  movieDetails.originalLanguage,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          ratingBar(movieDetails),
          const SizedBox(height: 10),
          genreWrapper(context: context, movieDetails: movieDetails),
          const SizedBox(height: 10),

          // const SizedBox(height: 10),
          Text(
            movieDetails.overview,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  RatingBar ratingBar(Movie movieDetails) {
    return RatingBar(
      onRatingUpdate: (x) {},
      ignoreGestures: true,
      initialRating: movieDetails.voteAverage / 2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        half: const Icon(
          Icons.star_half,
          color: Colors.amber,
        ),
        empty: const Icon(
          Icons.star_border,
          color: Colors.amber,
        ),
      ),
    );
  }

  Wrap genreWrapper(
      {required BuildContext context, required Movie movieDetails}) {
    return Wrap(
      children: movieDetails.genres
          .map(
            (genre) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                backgroundColor: Colors.deepPurpleAccent,
                shadowColor: Colors.black,
                // elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: MaterialStateColor.resolveWith(
                  (states) => Colors.deepPurpleAccent,
                ),
                label: Text(
                  genre.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
