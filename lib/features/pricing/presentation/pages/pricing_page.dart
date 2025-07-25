import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/features/pricing/presentation/pages/pricing_desktop.dart';
import 'package:short_url/features/pricing/presentation/pages/pricing_mobile.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isMobile ? PricingMobile() : PricingDesktop();
  }
}
