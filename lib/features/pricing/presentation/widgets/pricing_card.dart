import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/features/pricing/data/pricing_model.dart';

class PricingCard extends StatelessWidget {
  final PricingModel data;
  const PricingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: AppColors.primaryColor,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: context.width*0.4,
        height: context.width*0.3,
        margin: AppSizes.edgeAll(context.width*0.002),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        // constraints: BoxConstraints(
        //   minWidth: context.width/6,
        //   maxWidth: context.width/4,
        //   minHeight: context.height * 0.4,
        //   maxHeight: context.height * 0.6,
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title),
            Text('\$ ${data.price}'),
            Text(data.subTitle),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                data.features.length,
                (index) => Text('✓ ${data.features[index]}'),
              ),
            ),
            AppButton(label: 'Get Started', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
