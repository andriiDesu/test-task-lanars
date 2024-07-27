import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/core/navigation/route_state.dart';
import 'package:lanars_test/modules/common/bloc/base_bloc.dart';
import 'package:lanars_test/modules/common/view/base_layout.dart';

abstract class BaseScreen<S extends BaseState, B extends BaseBloc<S>,
    L extends BaseLayout> extends StatelessWidget {
  const BaseScreen({super.key});

  @protected
  abstract final L layout;

  @protected
  abstract final B bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (_) => bloc,
      child: Builder(
        builder: (context) {
          return BlocListener<RouteCubit, RouteState>(
            bloc: context.read<B>().routeCubit,
            listener: onRoute,
            child: layout,
          );
        },
      ),
    );
  }

  @protected
  @mustCallSuper
  void onRoute(BuildContext context, RouteState state) {
    if(state is BackRouteState) {
      Navigator.pop(context);
    }
  }
}
