import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

class PricingHeader extends StatelessWidget {
  const PricingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldColor,
      width: context.width,
      child: Padding(
        padding:context.isMobile?AppSizes.edgeVH(v: context.width*0.06):AppSizes.edgeVH(v: context.width*0.01),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSizes.gap(h: context.isMobile?context.width*0.02:context.width*0.01),
            Text(
              'Simple & Transparent Pricing',
              style: context.theme.textTheme.headlineLarge!.copyWith(
                fontSize: context.isMobile?context.width*0.07:context.width*0.025
              ),
            ),
            Text(
              'Choose a plan that fits your needs',
              style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: context.isMobile?context.width*0.035:context.width*0.014,
                fontWeight: FontWeight.w600,
                color: AppColors.subTextColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
