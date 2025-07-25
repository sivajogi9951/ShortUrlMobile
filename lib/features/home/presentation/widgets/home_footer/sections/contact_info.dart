import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {

    buildInfo(IconData icon, String text) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.whiteDarkColor),
          AppSizes.gap(w:context.width*0.01),
          Expanded(child: Text(
            text,
            style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: context.isMobile?context.dynamicFont(0.02):context.dynamicFont(0.01),
                color: AppColors.whiteDarkColor
            ),
          ),),
        ],
      );
    }

    return Padding(
      padding: AppSizes.edgeAll(context.width*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Contact Info',
            style: context.theme.textTheme.headlineLarge!.copyWith(
                fontSize: context.isMobile?context.dynamicFont(0.03):context.dynamicFont(0.015),
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor
            ),
          ),
          AppSizes.gap(h: context.width*0.005),
          buildInfo(Icons.mail_outline, 'info@signitives.net'),
          AppSizes.gap(h: context.width*0.005),
          buildInfo(Icons.phone_outlined, '+1 (555) 123-4567'),
          AppSizes.gap(h: context.width*0.005),
          buildInfo(
            Icons.location_on_outlined,
            '19th Floor, Vijaya Krishna Towers, Madhava\nReddy Colony, Gachibowli – 500032,\nHyderabad, Telangana, India',
          ),
        ],
      ),
    );
  }
}
