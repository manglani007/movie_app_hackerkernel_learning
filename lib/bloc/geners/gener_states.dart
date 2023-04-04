import 'package:movie_app/models/gener_model.dart';

abstract class GenresState {}

class GenresLoadingState extends GenresState {}

class GenresLoaded extends GenresState {
  final List<Genres> ganers;
  GenresLoaded(this.ganers);
}

class GenresSelectedState extends GenresState {
  final Genres ganers;
  final List<Genres> allGaners;
  GenresSelectedState(this.ganers, this.allGaners);
}

class GenresStateError extends GenresState {}
