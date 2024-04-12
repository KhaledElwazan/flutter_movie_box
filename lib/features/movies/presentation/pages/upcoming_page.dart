import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movies/brief_movie_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/widgets/movie_card.dart';
import 'package:flutter_movie_box/injection_container.dart';

class UpcomingPage extends StatefulWidget {
  static const String routeName = '/upcoming';
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Movies'),
        centerTitle: true,
      ),
      body: BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(getMovies: sl())
          ..add(const GetMoviesEvent(category: MovieCategory.upcoming)),
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
