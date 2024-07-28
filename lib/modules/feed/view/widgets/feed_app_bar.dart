import 'package:flutter/material.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: ColorConst.white,
      title: const Text('List page', style: StylesConst.titleLargeSysLightOnSurface,),
      leading: InkWell(
        borderRadius: BorderRadius.circular(60),
        onTap: () {},
        child: const Icon(
          Icons.menu,
          size: 24,
        ),
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(14),
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
