part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class FetchMoviesList extends MoviesEvent {
  final Genres genres;
  FetchMoviesList(this.genres);
}

class MovieSelectedEvent extends MoviesEvent {
  final Movie movie;
  MovieSelectedEvent(this.movie);
}
