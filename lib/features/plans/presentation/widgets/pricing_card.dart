import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/features/plans/data/model/plan_model.dart';

class PricingCard extends StatelessWidget {
  final PlanModel data;
  const PricingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: AppColors.primaryColor,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Container(
          width: context.setFontSize(300),
          height: context.setFontSize(500),
          margin: AppSizes.edgeVH(
            v: context.width * 0.004,
            h: context.width * 0.004,
          ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.name!,
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontSize: context.setFontSize(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Text(
                    data.priceDisplay!,
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontSize: context.setFontSize(18),
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(data.description!),
                ],
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  data.features!.length,
                      (index) => Text('✓ ${data.features![index]}'),
                ),
              ),),
              AppButton(label: 'Get Started', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
