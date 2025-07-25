import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';

class UtmBuilder extends StatelessWidget {
  const UtmBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.isMobile?AppSizes.edgeAll(context.width*0.03):AppSizes.edgeAll(context.width*0.005),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UTM Link Builder',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                fontSize: context.isMobile
                    ? context.dynamicFont(0.03)
                    : context.dynamicFont(0.015),
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'Website URL',
                  ),
                ),
                AppSizes.gap(w: context.width * 0.01),
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'Campaign Id',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'UTM Source',
                  ),
                ),
                AppSizes.gap(w: context.width * 0.01),
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'UTM Medium',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'UTM Campaign',
                  ),
                ),
                AppSizes.gap(w: context.width * 0.01),
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'UTM Add Units',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'UTM Term (Optional)',
                  ),
                ),
                AppSizes.gap(w: context.width * 0.01),

                Expanded(
                  child: AppTextFields(
                    controller: TextEditingController(),
                    hintText: 'UTM Content (Optional)',
                  ),
                ),
              ],
            ),
            AppSizes.gap(h: context.width * 0.02),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppButton(label: 'Generate Link', onPressed: () {}),
                ),
                AppSizes.gap(w: context.width*0.01),
                Expanded(flex: 1, child: AppButton(label: 'Copy')),
                AppSizes.gap(w: context.width*0.01),
                Expanded(flex: 1, child: AppButton(label: 'Reset')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
