import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/const/tmdb-const.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: BlocProvider(
        create: (context) =>
            MovieDetailBloc()..add(FetchMovieDetailsEvent(movie)),
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return Center(child: const CircularProgressIndicator());
            }
            if (state is MovieDetailLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(TmdbConsts.kImageBaseUrl +
                        state.movieDetail.posterPath!),
                    Text(state.movieDetail.overview!)
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
