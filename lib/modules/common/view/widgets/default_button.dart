import 'package:flutter/material.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: ColorConst.sysLightPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          style: StylesConst.labelLargeWhite,
        ),
      ),
    );
  }
}
