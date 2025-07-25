import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/home/presentation/widgets/home_footer/home_footer.dart';
import 'package:short_url/features/home/presentation/widgets/home_header.dart';
import 'package:short_url/features/home/presentation/widgets/home_illustrate.dart';
import 'package:short_url/features/home/presentation/widgets/home_tabs.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(),
          SizedBox(
            height: context.height * 0.8,
            child: Row(
              children: [
                Expanded(flex: 2, child: HomeIllustrate()),
                Expanded(flex: 2, child: HomeTabs()),
              ],
            ),
          ),
          Container(
            color: AppColors.footerBgColor,
            width: double.infinity,
            child: HomeFooter(),
          ),
        ],
      ),
    );
  }
}
