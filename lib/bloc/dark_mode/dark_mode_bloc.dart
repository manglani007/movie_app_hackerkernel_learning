import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(DarkModeDisabled()) {
    on<DarkModeEnableEvent>((event, emit) {
      emit(DarkModeEnabled());
    });

    on<DarkModeDisableEvent>((event, emit) {
      emit(DarkModeDisabled());
    });
  }
}
