import 'package:flutter/material.dart';

extension FocusX on BuildContext {
  void clearFocus() => FocusScope.of(this).unfocus();

  static void clearPrimaryFocus() => FocusManager.instance.primaryFocus?.unfocus();
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get topPadding => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;
}
