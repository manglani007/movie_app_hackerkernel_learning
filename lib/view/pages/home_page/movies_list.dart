import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movies_bloc.dart';
import 'package:movie_app/const/tmdb-const.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/view/pages/movie_details/movie_details_page.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesBloc, MoviesState>(
      listener: (context, state) {
        if (state is MovieSelectedState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MovieDetailPage(movie: state.movie),
          ));
        }

        if (state is MoviesStateError) {
          log("ERROORO");
        }
      },
      builder: (context, state) {
        if (state is LoadingMovieState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MoviesStateError) {
          return const Center(child: Text("Something Went Wrong"));
        }

        if (state is MoviesStateError) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LoadedMovieState) {
          List<Widget> cardList = [];
          for (var movie in state.movieList.results!) {
            cardList.add(movieCard(movie, context));
          }
          return ListView(
            children: cardList,
          );
        }
        return Container();
      },
    );
  }

  Widget movieCard(Movie movie, context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => MovieDetailPage(movie: movie),
        ));
        //BlocProvider.of<MoviesBloc>(context).add(MovieSelectedEvent(movie));
      },
      title: Text(movie.title.toString()),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(TmdbConsts.kImageBaseUrl + movie.posterPath!),
      ),
      trailing: const Icon(Icons.arrow_circle_right),
    );
  }
}
