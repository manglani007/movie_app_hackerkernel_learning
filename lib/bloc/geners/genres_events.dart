import 'package:movie_app/models/gener_model.dart';

abstract class GenresEvent {}

class GenresInitial extends GenresEvent {}

class GenresFetch extends GenresEvent {}

class GenresSelectedEvent extends GenresEvent {
  final Genres selectedGenres;
  final List<Genres> allGenres;
  GenresSelectedEvent(this.selectedGenres, this.allGenres);
}
