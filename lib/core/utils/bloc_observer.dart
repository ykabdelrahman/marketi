import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('change = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('error = $error, stackTrace = $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('event = $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(
      'transition: currentState = ${transition.currentState}, event = ${transition.event}, nextState = ${transition.nextState}',
    );
  }

  void onStateChange(Bloc bloc, Change change) {
    log('stateChange: bloc = $bloc, change = $change');
  }
}
