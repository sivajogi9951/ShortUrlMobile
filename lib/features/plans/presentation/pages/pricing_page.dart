import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/features/plans/presentation/pages/pricing_desktop.dart';
import 'package:short_url/features/plans/presentation/pages/pricing_mobile.dart';
import 'package:short_url/features/plans/presentation/provider/plans_provider.dart';

class PricingPage extends ConsumerWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansAsync = ref.watch(plansProvider);

    return plansAsync.when(
      data: (plans) => context.isMobile
          ? PricingMobile(plans: plans)
          : PricingDesktop(plans: plans),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }
}
