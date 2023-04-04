part of 'dark_mode_bloc.dart';

@immutable
abstract class DarkModeState {}

class DarkModeDisabled extends DarkModeState {}

class DarkModeEnabled extends DarkModeState {}
