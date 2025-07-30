import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

class AboutUsHeader extends StatelessWidget {
  const AboutUsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSizes.gap(h: context.width*0.04),
        RichText(
          text: TextSpan(
            text: 'About ',
        style:context.theme.textTheme.displayLarge!.copyWith(
            fontSize: context.setFontSize(32),
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor
        ),
            children: [
              TextSpan(),
              TextSpan(
                text: 'ShortLink',
                style: context.theme.textTheme.displayLarge!.copyWith(
                    fontSize: context.setFontSize(28),
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryAccentColor
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15,),
        Text(
          'ShortLink is on a mission to make the internet more accessible and efficient by providing a reliable, secure, and user-friendly URL shortening service.',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleSmall!.copyWith(
              fontSize: context.setFontSize(14),
              color: AppColors.subTextColor
          ),
        ),
        AppSizes.gap(h: context.width*0.02),

      ],
    );
  }
}
