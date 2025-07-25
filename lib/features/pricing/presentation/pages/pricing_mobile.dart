import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/features/pricing/data/pricing_model.dart';
import 'package:short_url/features/pricing/presentation/widgets/pricing_card.dart';
import 'package:short_url/features/pricing/presentation/widgets/pricing_header.dart';

class PricingMobile extends StatelessWidget {
  const PricingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          children: [
            PricingHeader(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.vertical,
                  children: List.generate(dummyPricingList.length, (index) => PricingCard(data: dummyPricingList[index],)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
