part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityAvailable extends ConnectivityState {}

class ConnectivityNotAvailable extends ConnectivityState {}
