import 'package:flutter/material.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';
import 'package:short_url/features/plans/presentation/widgets/pricing_card.dart';
import 'package:short_url/features/plans/presentation/widgets/pricing_header.dart';

class PricingDesktop extends StatelessWidget {
  final List<PlanModel> plans;
  const PricingDesktop({super.key,required this.plans});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PricingHeader(),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(plans.length, (index) => PricingCard(data: plans[index],)),
            ),
          ),
        ],
      ),
    );
  }
}
