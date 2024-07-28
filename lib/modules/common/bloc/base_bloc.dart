import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/core/navigation/route_state.dart';

part 'base_state.dart';
part 'base_event.dart';

abstract class BaseBloc<S extends BaseState, E extends BaseEvent> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  final routeCubit = RouteCubit();
  final progressCubit = ProgressCubit();
  late final errorCubit = ErrorCubit();

  @protected
  Future<void> execute<T>(
    Future<T> action, {
    required void Function() retry,
    void Function(T result)? onSuccess,
    void Function(ErrorState error)? onError,
    bool withProgress = true,
  }) async {
    if (withProgress) showProgress();
    action.then((result) {
      onSuccess?.call(result);
    }).catchError((Object e) {
      final error = ErrorState(retry, ExecutionError(e));
      onError != null ? onError(error) : handleError(error);
    }).whenComplete(() {
      if (withProgress) hideProgress();
    });
  }

  @protected
  void addRoute(RouteState state) => routeCubit.emit(state);

  @protected
  void showProgress() => progressCubit.emit(true);

  @protected
  void hideProgress() => progressCubit.emit(false);

  @protected
  bool inProgress() => progressCubit.state;

  @protected
  void handleError(ErrorState error) => errorCubit.emit(error);
}

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteState());
}

class ProgressCubit extends Cubit<bool> {
  ProgressCubit() : super(false);
}

class ErrorCubit extends Cubit<ErrorState> {
  ErrorCubit() : super(ErrorState(() {}));
}

class ErrorState {
  ErrorState(
    this.retry, [
    this.error,
  ]);

  final ExecutionError? error;
  final void Function() retry;
}

class ExecutionError {
  ExecutionError(this.cause);

  final Object? cause;

  @override
  String toString() {
    return 'ExecutionError{cause: $cause}';
  }
}
