import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/features/plans/domain/entity/billing_option_entity.dart';

class BillingCard extends StatelessWidget {
  final List<BillingOptionEntity> data;
  const BillingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Wrap(
          children: List.generate(
            data.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: context.proportionateWidth(10)),
              constraints: BoxConstraints(
                maxWidth: context.proportionateWidth(200),
                minWidth: context.proportionateWidth(200)
              ),
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Text(
                    '${data[index].durationMonths} Months',
                    style: context.theme.textTheme.headlineMedium!.copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    data[index].pricePerMonth.toString(),
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  Text(
                    data[index].savingsMessage,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  AppButton(label: data[index].ctaText, onPressed: () {
                    context.pop();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
