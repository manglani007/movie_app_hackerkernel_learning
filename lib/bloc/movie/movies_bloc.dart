import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/gener_model.dart';
import 'package:movie_app/models/movie_detail.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repo/movie-tmdb-repo.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    final movieRepo = MovieRepo();
    on<FetchMoviesList>((event, emit) async {
      emit(LoadingMovieState());
      try {
        MovieList movieList = await movieRepo.getMovieList(event.genres);
        emit(LoadedMovieState(movieList));
      } catch (e) {
        //log(e.toString());
      }
    });

    on<MovieSelectedEvent>((event, emit) async {
      emit(MovieSelectedState(event.movie));
      // emit(MovieDetailsLoading(event.movie));
      // try {
      //   MovieDetail movieDetail = await _movieRepo.getMovieDetails(event.movie);
      //   emit(MovieDetailsLoaded(movieDetail,event.));
      // } catch (e) {
      //   print(e);
      // }
    });
  }
}
