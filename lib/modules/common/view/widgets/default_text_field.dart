import 'package:flutter/material.dart';
import 'package:lanars_test/core/util/validator_util.dart';
import 'package:lanars_test/domain/enums/validator_enum.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    required this.labelText,
    required this.hintText,
    required this.validatorEnum,
    required this.controller,
    required this.focusNode,
    this.inProgress = false,
    this.hasError = false,
    super.key,
  });

  final String labelText;
  final String hintText;
  final ValidatorEnum validatorEnum;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool inProgress;
  final bool hasError;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  TextStyle get hintStyle => widget.inProgress
      ? StylesConst.bodyLargeSysLightOnSurfaceVariantOpacity38
      : StylesConst.bodyLargeSysLightOnSurfaceVariant;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, value, __) {
        return SizedBox(
          height: 76,
          child: TextField(
            cursorWidth: 1,
            focusNode: widget.focusNode,
            controller: widget.controller,
            cursorColor: ColorConst.sysLightPrimary,
            cursorErrorColor: ColorConst.sysLightError,
            style: hintStyle,
            decoration: InputDecoration(
              errorText: _validator(widget.controller.text),
              hintText: widget.hintText,
              labelText: widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: widget.inProgress
                  ? StylesConst.bodySmallSysLightOnSurfaceOpacity38
                  : StylesConst.bodySmallSysLightOnSurfaceVariant,
              hintStyle: hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(
                  color: widget.inProgress
                      ? ColorConst.stateLayersLightOutlineOpacity12
                      : ColorConst.sysLightOutline,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(
                  color: widget.inProgress
                      ? ColorConst.stateLayersLightOutlineOpacity12
                      : ColorConst.sysLightOutline,
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
                borderSide: BorderSide(
                  width: 2,
                  color: widget.inProgress
                      ? ColorConst.stateLayersLightOutlineOpacity12
                      : ColorConst.sysLightPrimary,
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  String? _validator(String? text, {bool clearState = false,}) {
    if(widget.controller.text.isEmpty && !widget.hasError) {
      return null;
    }

    if (!widget.focusNode.hasFocus || widget.hasError) {
      return widget.validatorEnum == ValidatorEnum.email
          ? ValidatorUtil.validateEmail(text, clearState)
          : ValidatorUtil.validatePassword(text, clearState);
    }

    return null;
  }
}
