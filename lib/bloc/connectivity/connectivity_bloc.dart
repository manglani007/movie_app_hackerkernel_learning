import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription _subscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityCheckEvent>((event, emit) async {
      await Connectivity().checkConnectivity().then((status) {
        if (status == ConnectivityResult.none) {
          //emit(ConnectivityNotAvailable());
        }
      });
    });
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityNotAvailable());
      } else {
        emit(ConnectivityAvailable());
      }
    });
    // on<ConnectivityEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
