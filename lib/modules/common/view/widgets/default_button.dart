import 'package:flutter/material.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.label,
    required this.onTap,
    this.inProgress = false,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final bool inProgress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: ColorConst.sysLightPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: inProgress
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: ColorConst.white,
                ),
              )
            : Text(
                label,
                style: StylesConst.labelLargeWhite,
              ),
      ),
    );
  }
}
