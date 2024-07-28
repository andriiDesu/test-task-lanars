import 'package:flutter/material.dart';
import 'package:lanars_test/resources/constants/colors.dart';

const _robotoMedium = 'RobotoMedium';
const _robotoRegular = 'RobotoRegular';

class StylesConst {
  StylesConst._();

  static const bodyLargeSysLightOnSurfaceVariant = TextStyle(
    color: ColorConst.sysLightOnSurfaceVariant,
    fontFamily: _robotoRegular,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1,
    letterSpacing: 0.5,
  );
  static final bodyLargeSysLightOnSurfaceVariantOpacity38 = TextStyle(
    color: ColorConst.sysLightOnSurfaceVariantOpacity38,
    fontFamily: _robotoRegular,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1,
    letterSpacing: 0.5,
  );

  static const bodyMediumSysLightInverseOnSurface = TextStyle(
    color: ColorConst.sysLightInverseOnSurface,
    fontFamily: _robotoRegular,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
  );

  static const bodySmallSysLightOnSurfaceVariant = TextStyle(
    color: ColorConst.sysLightOnSurfaceVariant,
    fontFamily: _robotoRegular,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const bodySmallSysLightError = TextStyle(
    color: ColorConst.sysLightOnSurfaceVariant,
    fontFamily: _robotoRegular,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static final bodySmallSysLightOnSurfaceOpacity38 = TextStyle(
    color: ColorConst.sysLightOnSurfaceOpacity38,
    fontFamily: _robotoRegular,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1,
  );

  static const headlineLargeSysLightOnSurface = TextStyle(
    color: ColorConst.sysLightOnSurface,
    fontFamily: _robotoMedium,
    fontWeight: FontWeight.w500,
    fontSize: 32,
  );

  static const labelLargeWhite = TextStyle(
    color: ColorConst.white,
    fontFamily: _robotoMedium,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
}
