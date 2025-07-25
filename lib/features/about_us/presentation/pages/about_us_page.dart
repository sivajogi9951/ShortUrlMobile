import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/features/about_us/presentation/pages/about_us_desktop.dart';
import 'package:short_url/features/about_us/presentation/pages/about_us_mobile.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.isMobile?AboutUsMobile():AboutUsDesktop(),
    );
  }
}
