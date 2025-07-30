import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/navigation/route_name.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/app_bar/my_app_bar.dart';

class TrademarkInfo extends StatelessWidget {
  const TrademarkInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: context.width*0.01,color: AppColors.subTextColor,),
        Text(
          '© 2025 ShortLink. All rights reserved.',style: context.theme.textTheme.bodySmall!.copyWith(
          color: AppColors.subTextColor,
          fontSize: context.setFontSize(14),
          fontWeight: FontWeight.bold
        ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LargeAppBarMenuItem(
              text: 'Privacy Policy',
              isSelected: false,
              textColor: AppColors.blueAccentColor,
              onTap: () =>
                  GoRouter.of(context).goNamed(RouteName.termsConditions),
            ),
            LargeAppBarMenuItem(
              text: 'Terms of Service',
              isSelected: false,
              textColor: AppColors.blueAccentColor,
              onTap: () =>
                  GoRouter.of(context).goNamed(RouteName.termsConditions),
            ),
          ],
        ),
      ],
    );
  }
}
