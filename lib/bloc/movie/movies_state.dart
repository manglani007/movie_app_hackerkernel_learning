part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class LoadingMovieState extends MoviesState {}

class LoadedMovieState extends MoviesState {
  final MovieList movieList;
  LoadedMovieState(this.movieList);
}

class MovieSelectedState extends MoviesState {
  final Movie movie;
  MovieSelectedState(this.movie);
}

class MovieDetailsLoading extends MoviesState {
  final Movie movie;

  MovieDetailsLoading(this.movie);
}

class MovieDetailsLoaded extends MoviesState {
  final MovieDetail movieDetail;
  final MovieList movieList;
  MovieDetailsLoaded(this.movieDetail, this.movieList);
}

class MoviesStateError extends MoviesState {}
