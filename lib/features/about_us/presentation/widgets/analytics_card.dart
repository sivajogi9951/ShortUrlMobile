import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/about_us/data/model/analytics_model.dart';

class AnalyticsCard extends StatelessWidget {
  final AnalyticsModel data;

  const AnalyticsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.setFontSize(8),
          vertical: context.setFontSize(4),
        ),
        width: context.setFontSize(250),
        child: Column(
          children: [
            AppSizes.gap(h: context.width * 0.015),
            Container(
              width: context.setFontSize(50),
              height: context.setFontSize(50),
              decoration: BoxDecoration(
                color: AppColors.primaryAccentColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  data.icon,
                  size: context.setFontSize(24),
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            AppSizes.gap(h: context.width * 0.01),
            Text(
              data.title,
              style: context.theme.textTheme.displayLarge!.copyWith(
                fontSize: context.setFontSize(24),
                fontWeight: FontWeight.bold,
                color: AppColors.primaryAccentColor,
              ),
            ),
            AppSizes.gap(h: context.width * 0.01),
            Text(
              data.subTitle,
              style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: context.setFontSize(16),
                color: AppColors.subTextColor,
              ),
            ),
            AppSizes.gap(h: context.width * 0.01),
          ],
        ),
      ),
    );
  }
}
