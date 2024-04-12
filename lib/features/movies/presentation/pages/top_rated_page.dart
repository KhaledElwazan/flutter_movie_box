import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movies/brief_movie_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/widgets/movie_card.dart';
import 'package:flutter_movie_box/injection_container.dart';

class TopRatedPage extends StatefulWidget {
  static const String routeName = '/top-rated';
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
        centerTitle: true,
      ),
      body: BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(getMovies: sl())
          ..add(const GetMoviesEvent(category: MovieCategory.topRated)),
        child: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return BlocBuilder<MovieBloc, MovieState>(builder: (_, state) {
      if (state is LoadingMovies) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadedMovies) {
        return ListView.builder(
          itemCount: state.movies.length,
          itemBuilder: (_, index) => MovieCard(movie: state.movies[index]),
        );
      } else if (state is ErrorLoadingMovies) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
