import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/core/extensions/build_context_extension.dart';
import 'package:lanars_test/data/source/remote/network_errors.dart';
import 'package:lanars_test/modules/common/bloc/base_bloc.dart';
import 'package:lanars_test/modules/common/view/widgets/default_snack_bar.dart';
import 'package:lanars_test/resources/constants/colors.dart';

abstract class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});
}

abstract class BaseLayoutState<S extends BaseState, L extends BaseLayout,
    B extends BaseBloc<S>> extends State<L> {
  @protected
  late final B bloc;
  @protected
  bool inSafeArea = true;

  @protected
  Color backgroundColor = ColorConst.white;

  @protected
  bool showPadding = true;

  @protected
  bool resizeContentOnKeyboard = false;

  @override
  void initState() {
    super.initState();
    bloc = context.read<B>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit());
  }

  @protected
  void onInit() {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorCubit, ErrorState>(
      bloc: bloc.errorCubit,
      listener: (_, state) {
        if (state.error != null) {
          handleError(state.error);
        }
      },
      child: BlocBuilder<ProgressCubit, bool>(
        builder: (_, inProgress) => PopScope(
          canPop: inProgress,
          child: IgnorePointer(
            ignoring: inProgress,
            child: GestureDetector(
              onTap: context.clearFocus,
              child: Scaffold(
                resizeToAvoidBottomInset: resizeContentOnKeyboard,
                appBar: buildAppBar(context),
                bottomNavigationBar: buildBottomNavBar(context),
                backgroundColor: backgroundColor,
                body: Padding(
                  padding: showPadding
                      ? const EdgeInsets.symmetric(horizontal: 16)
                      : EdgeInsets.zero,
                  child: inSafeArea
                      ? SafeArea(
                          child: buildLayout(context),
                        )
                      : buildLayout(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget? buildBottomNavBar(BuildContext context) => null;

  @protected
  Widget buildLayout(BuildContext context);

  @protected
  void handleError(ExecutionError? error) {
    String message = 'Unknown error, try again later';

    if (error?.cause is NetworkError) {
      message = 'Server error. Please, try again';
    }

    showSnackBar(message: message);
  }

  void showSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultSnackBar(
          message: message,
        ),
      ),
    );
  }
}
