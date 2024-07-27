import 'package:flutter/material.dart';
import 'package:lanars_test/core/util/validator_util.dart';
import 'package:lanars_test/domain/enums/validator_enum.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    required this.labelText,
    required this.hintText,
    required this.validatorEnum,
    super.key,
  });

  final String labelText;
  final String hintText;
  final ValidatorEnum validatorEnum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: TextFormField(
        validator: validatorEnum == ValidatorEnum.email
            ? ValidatorUtil.validateEmail
            : ValidatorUtil.validatePassword,
        style: StylesConst.bodyLargeSysLightOnSurfaceVariant,
        cursorColor: ColorConst.sysLightPrimary,
        cursorErrorColor: ColorConst.sysLightError,
        cursorWidth: 1,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: StylesConst.bodyLargeSysLightOnSurfaceVariant,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: ColorConst.sysLightOutline,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              width: 2,
              color: ColorConst.sysLightError,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              width: 2,
              color: ColorConst.sysLightError,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              width: 2,
              color: ColorConst.sysLightPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
