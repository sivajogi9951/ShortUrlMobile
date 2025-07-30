import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/navigation/route_name.dart';
import 'package:short_url/core/theme/app_colors.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.edgeAll(context.width*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Quick Links',
            style: context.theme.textTheme.headlineLarge!.copyWith(
                fontSize: context.setFontSize(24),
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor
            ),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).goNamed(RouteName.aboutUs),
            child: Text(
              'About Us',
              style: context.theme.textTheme.titleSmall!.copyWith(
                  fontSize: context.setFontSize(14),
                  color: AppColors.whiteDarkColor
              ),
            ),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).goNamed(RouteName.contactUs),
            child: Text(
              'Contact Us',
              style: context.theme.textTheme.titleSmall!.copyWith(
                  fontSize: context.setFontSize(14),
                  color: AppColors.whiteDarkColor
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                GoRouter.of(context).goNamed(RouteName.termsConditions),
            child: Text(
              'Terms & Conditions',
              style: context.theme.textTheme.titleSmall!.copyWith(
                  fontSize: context.setFontSize(14),
                  color: AppColors.whiteDarkColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
