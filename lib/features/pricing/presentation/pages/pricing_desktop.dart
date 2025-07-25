import 'package:flutter/material.dart';
import 'package:short_url/features/pricing/data/pricing_model.dart';
import 'package:short_url/features/pricing/presentation/widgets/pricing_card.dart';
import 'package:short_url/features/pricing/presentation/widgets/pricing_header.dart';

class PricingDesktop extends StatelessWidget {
  const PricingDesktop({super.key});

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
              children: List.generate(dummyPricingList.length, (index) => PricingCard(data: dummyPricingList[index],)),
            ),
          ),
        ],
      ),
    );
  }
}
