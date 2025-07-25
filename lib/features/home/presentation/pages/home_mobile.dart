import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/home/presentation/widgets/home_footer/home_footer.dart';
import 'package:short_url/features/home/presentation/widgets/home_header.dart';
import 'package:short_url/features/home/presentation/widgets/home_illustrate.dart';
import 'package:short_url/features/home/presentation/widgets/home_tabs.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeHeader(),
        SizedBox(
          width: context.width * 0.3,
          height: context.width * 0.5,
          child: HomeIllustrate(),
        ),
        SizedBox(width: context.width,height: context.width * 0.7,child: HomeTabs()),
        Container(color: AppColors.footerBgColor,child: HomeFooter()),
      ],
    );
  }
}
