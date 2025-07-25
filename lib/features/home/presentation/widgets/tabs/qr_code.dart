import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';

class QrCodeTab extends StatelessWidget {
  const QrCodeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.isMobile?AppSizes.edgeAll(context.width*0.03):AppSizes.edgeAll(context.width*0.005),
      children: [
        Text(
          'QR Code Metadata',
          style: context.theme.textTheme.headlineSmall!.copyWith(
              fontSize: context.isMobile?context.dynamicFont(0.03):context.dynamicFont(0.015),
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor
          ),
        ),
        AppSizes.gap(h: context.isMobile?context.width*0.03:context.width*0.005),
        AppTextFields(
          controller: TextEditingController(),
          hintText: 'Enter Link',
        ),
        AppSizes.gap(h: context.isMobile?context.width*0.03:context.width*0.005),
        AppButton(label: 'Submit', onPressed: () {}),
      ],
    );
  }
}
