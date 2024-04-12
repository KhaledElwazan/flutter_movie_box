import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/core/constants/base_urls.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  final BriefMovie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MovieDetailsBloc>(context)
            .add(GetMovieDetailsEvent(movieId: movie.id));

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return MovieDetailsPage(movie: movie);
            },
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: '$imageBaseUrl/${movie.backdropPath}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                        width: double.infinity,
                        height: 200,
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
            ),
            Positioned(
              bottom: 5,
              child: Card(
                color: Colors.transparent.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                movie.voteAverage
                                    .toStringAsPrecision(2)
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
