import 'package:flutter/material.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class DefaultSnackBar extends StatelessWidget {
  const DefaultSnackBar({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: StylesConst.bodyMediumSysLightInverseOnSurface,
          ),
          const Icon(
            Icons.close,
            color: ColorConst.sysLightInverseOnSurface,
          ),
        ],
      ),
    );
  }
}
