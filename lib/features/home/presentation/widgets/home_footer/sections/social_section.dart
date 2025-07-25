import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.edgeAll(context.width*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ShortLink',
            style: context.theme.textTheme.headlineLarge!.copyWith(
                fontSize: kIsWeb ?context.dynamicFont(0.03):context.dynamicFont(0.015),
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor
            ),
          ),
          AppSizes.gap(h: context.width*0.005),
          Text(
            'The most trusted URL shortener service',
            style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: context.isMobile?context.dynamicFont(0.02):context.dynamicFont(0.01),
                color: AppColors.whiteDarkColor
            ),
          ),
          AppSizes.gap(h: context.width*0.005),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            runSpacing: 8,
            spacing: 0,
            children: [
              FlutterSocialButton(
                iconSize: context.width*0.009,
                mini: true,
                onTap: () {},
                buttonType: ButtonType.facebook,
              ),
              FlutterSocialButton(
                iconSize: context.width*0.009,
                mini: true,
                onTap: () {},
                buttonType: ButtonType.twitter,
              ),
              FlutterSocialButton(
                iconSize: context.width*0.009,
                mini: true,
                onTap: () {},
                buttonType: ButtonType.instagram,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
