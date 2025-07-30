import 'package:flutter/cupertino.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

class ContactUsHeader extends StatelessWidget {
  const ContactUsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16,),
        Text('Contact Us',style: context.theme.textTheme.displayLarge!.copyWith(
            fontSize: context.setFontSize(32),
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor
        ),),
        SizedBox(height: 8,),
        Text('We\'d love to hear from you! Our team is here to help.',style: context.theme.textTheme.bodyMedium!.copyWith(
            fontSize: context.setFontSize(14),
            color: AppColors.subTextColor
        ),)
      ],
    );
  }
}
