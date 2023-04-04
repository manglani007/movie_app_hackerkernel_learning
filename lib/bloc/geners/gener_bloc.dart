import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/repo/movie-tmdb-repo.dart';

import 'gener_states.dart';
import 'genres_events.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final _movieRepo = MovieRepo();
  GenresBloc() : super(GenresLoadingState()) {
    on<GenresFetch>((event, emit) async {
      emit(GenresLoadingState());
      try {
        var allGenresList = await _movieRepo.getAllgenres();
        emit(GenresLoaded(allGenresList));
      } catch (e) {
        emit(GenresStateError());
      }
    });

    on<GenresSelectedEvent>((event, emit) async {
      emit(GenresSelectedState(event.selectedGenres, event.allGenres));
    });
  }
}
