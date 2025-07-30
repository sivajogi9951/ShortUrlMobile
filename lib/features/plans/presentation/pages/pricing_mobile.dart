import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';
import 'package:short_url/features/plans/presentation/widgets/pricing_card.dart';
import 'package:short_url/features/plans/presentation/widgets/pricing_header.dart';

class PricingMobile extends StatelessWidget {
  final List<PlanModel> plans;
  const PricingMobile({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          children: [
            PricingHeader(),
            Expanded(
              child: plans.isNotEmpty
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: List.generate(
                          plans.length,
                          (index) => PricingCard(data: plans[index]),
                        ),
                      ),
                    )
                  : Center(child: Text('No Data')),
            ),
          ],
        ),
      ),
    );
  }
}
