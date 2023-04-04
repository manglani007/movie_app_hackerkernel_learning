part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

class FetchMovieDetailsEvent extends MovieDetailEvent {
  final Movie movie;
  FetchMovieDetailsEvent(this.movie);
}
