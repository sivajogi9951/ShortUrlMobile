import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.edgeAll(context.width*0.01),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSizes.gap(h: context.width*0.01),
          RichText(
            text: TextSpan(
              text: 'Shorten Your URLs ',
              style: context.theme.textTheme.displayLarge!.copyWith(
                fontSize: context.setFontSize(32),
                fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
              ),
              children: [
                TextSpan(),
                TextSpan(
                  text: 'Instantly',
                  style: context.theme.textTheme.displayLarge!.copyWith(
                      fontSize: context.setFontSize(28),
                      fontWeight: FontWeight.bold,
                    color: AppColors.blueAccentColor
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          AppSizes.gap(h: context.width*0.005),
          Text(
            'Transform long, complex URLs into short, shareable links.',
            style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: context.setFontSize(14),
                fontWeight: FontWeight.bold,
                color: AppColors.subTextColor
            ),
          ),
        ],
      ),
    );
  }
}
