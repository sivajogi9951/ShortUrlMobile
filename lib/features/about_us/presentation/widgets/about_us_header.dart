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
        RichText(
          text: TextSpan(
            text: 'About ',
            children: [
              TextSpan(),
              TextSpan(
                text: 'ShortLink',
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'ShortLink is on a mission to make the internet more accessible and efficient by providing a reliable, secure, and user-friendly URL shortening service.',

          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
