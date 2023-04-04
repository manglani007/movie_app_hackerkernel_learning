part of 'dark_mode_bloc.dart';

@immutable
abstract class DarkModeEvent {}

class DarkModeEnableEvent extends DarkModeEvent {}

class DarkModeDisableEvent extends DarkModeEvent {}
