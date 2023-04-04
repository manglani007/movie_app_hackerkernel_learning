import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/movie_detail.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repo/movie-tmdb-repo.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    final movieRepo = MovieRepo();
    on<FetchMovieDetailsEvent>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        MovieDetail movieDetail = await movieRepo.getMovieDetails(event.movie);
        emit(MovieDetailLoaded(movieDetail));
      } catch (e) {
        // log(e.toString());
      }
    });
  }
}
