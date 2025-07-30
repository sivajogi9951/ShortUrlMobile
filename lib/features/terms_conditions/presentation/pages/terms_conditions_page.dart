import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/terms_conditions/presentation/widgets/tc_header.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TcHeader(),
          Expanded(
            child: Center(
              child: Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 20,
                child: Container(
                  width: context.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView(
                    children: [
                      _titleDesc(
                        context,
                        '1. Acceptance of Terms',
                        'By accessing and using ShortLink\'s services, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
                      ),
                      _titleDesc(
                        context,
                        '2. Service Description',
                        'ShortLink provides URL shortening services that allow users to create shortened versions of long URLs. Our service is provided "as is" and we reserve the right to modify or discontinue the service at any time without notice.',
                      ),
                      _titleDesc(
                        context,
                        '3. Privacy Policy',
                        'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your information when you use our service. By using our service, you agree to the collection and use of information in accordance with our Privacy Policy.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _titleDesc(BuildContext context, String t, String s) {
    return ListTile(
      title: Text(
        t,
        style: context.theme.textTheme.titleMedium!.copyWith(
          fontSize: context.setFontSize(16),
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Text(s,
          style: context.theme.textTheme.bodyMedium!.copyWith(
            fontSize: context.setFontSize(14),
            color: AppColors.blackColor,
          ),),
      ),
    );
  }
}
